import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/api/api_service.dart';
import 'package:shop/application/product_state.dart';
import 'package:shop/models/pagination.dart';
import 'package:shop/models/product_filter.dart';

class ProductsNotifier extends StateNotifier<ProductState> {
  final APIservice _apiService;
  final ProductFilterModel _filterModel;
  ProductsNotifier(this._apiService, this._filterModel)
      : super(const ProductState());
  int _page = 1;
  Future<void> getProducts() async {
    if (state.isLoading || !state.hasNext) {
      return;
    }

    state = state.copyWith(isLoading: true);
    var filterModel = _filterModel.copyWith(
        paginationModel: PaginationModel(page: _page, pagesize: 10));
    final products = await _apiService.getProducts(filterModel);
    final newProducts = [...state.products, ...products!];

    if (products.length % 10 != 0 || products.isEmpty) {
      state = state.copyWith(hasNext: false);
    }
    Future.delayed(const Duration(milliseconds: 1500), () {
      state = state.copyWith(products: newProducts);
      _page++;
      state = state.copyWith(isLoading: false);
    });
  }

  Future<void> refreshProducts() async {
    state = state.copyWith(products: [], hasNext: true);
    _page = 1;
    await getProducts();
  }
}
