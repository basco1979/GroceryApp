import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/application/product_state.dart';
import 'package:shop/models/category.dart';
import 'package:shop/models/pagination.dart';
import 'package:shop/api/api_service.dart';
import 'application/notifier/product_filter_notifier.dart';
import 'application/notifier/product_notifier.dart';
import 'models/product.dart';
import 'models/product_filter.dart';

final categoriesProvider =
    FutureProvider.family<List<Category>?, PaginationModel>(
        (ref, paginationModel) {
  final apirepository = ref.watch(apiService);
  return apirepository.getCategories(
      paginationModel.page, paginationModel.pagesize);
});

final homeProductsProvider =
    FutureProvider.family<List<Product>?, ProductFilterModel>(
        (ref, productFilterModel) {
  final apirepository = ref.watch(apiService);
  return apirepository.getProducts(productFilterModel);
});

final productFilterProvider =
    StateNotifierProvider<ProductsFilterNotifier, ProductFilterModel>(
        (ref) => ProductsFilterNotifier());

final productNotifierProvider =
    StateNotifierProvider<ProductsNotifier, ProductState>((ref) =>
        ProductsNotifier(
            ref.watch(apiService), ref.watch(productFilterProvider)));
