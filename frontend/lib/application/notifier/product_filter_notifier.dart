import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/models/pagination.dart';
import 'package:shop/models/product_filter.dart';

class ProductsFilterNotifier extends StateNotifier<ProductFilterModel> {
  ProductsFilterNotifier()
      : super(
          ProductFilterModel(
            paginationModel: PaginationModel(page: 0, pagesize: 10),
          ),
        );
  void setProductFilter(ProductFilterModel model) {
    state = model;
  }
}
