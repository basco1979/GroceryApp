import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/components/product_card.dart';
import 'package:shop/models/pagination.dart';
import 'package:shop/models/product_filter.dart';
import 'package:shop/models/product_sort.dart';
import 'package:shop/providers.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String? categoryId;
  String? categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Products")),
        body: Container(
          color: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductsFilter(
                categoryId: categoryId,
                categoryName: categoryName,
              ),
              Flexible(
                child: _ProductList(),
                flex: 1,
              )
            ],
          ),
        ));
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;
    if (arguments != null) {
      categoryName = arguments['categoryName'];
      categoryId = arguments['categoryId'];
    }
    super.didChangeDependencies();
  }
}

class _ProductsFilter extends ConsumerWidget {
  final _sortByOptions = [
    ProductSortModel(value: "createdAt", label: "Latest"),
    ProductSortModel(value: "-productPrice", label: "Price: High to Low"),
    ProductSortModel(value: "productPrice", label: "Price: Low to High")
  ];
  _ProductsFilter({Key? key, this.categoryName, this.categoryId})
      : super(key: key);

  final String? categoryName;
  final String? categoryId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterProvider = ref.watch(productFilterProvider);
    return RefreshIndicator(
        onRefresh: () async {
          ref.read(productNotifierProvider.notifier).refreshProducts();
        },
        child: Container(
          height: 51,
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(categoryName!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.grey[300]),
                child: PopupMenuButton(
                  onSelected: (sortBy) {
                    ProductFilterModel filterModel = ProductFilterModel(
                        paginationModel: PaginationModel(page: 0, pagesize: 10),
                        categoryId: filterProvider.categoryId,
                        sortBy: sortBy.toString());
                    ref
                        .read(productFilterProvider.notifier)
                        .setProductFilter(filterModel);
                  },
                  initialValue: filterProvider.sortBy,
                  itemBuilder: (BuildContext context) {
                    return _sortByOptions.map((item) {
                      return PopupMenuItem(
                        value: item.value,
                        child: InkWell(child: Text(item.label!)),
                      );
                    }).toList();
                  },
                  icon: const Icon(Icons.filter_list_alt),
                ),
              )
            ],
          ),
        ));
  }
}

class _ProductList extends ConsumerWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productNotifierProvider);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        final productsViewModel = ref.read(productNotifierProvider.notifier);
        final productsState = ref.watch(productNotifierProvider);
        if (productsState.hasNext) {
          productsViewModel.getProducts();
        }
      }
    });

    if (productState.hasNext && !productState.isLoading) {
      return const Center(
        child: Text("No Products"),
      );
      return const LinearProgressIndicator();
    }
    return Column(children: [
      Flexible(
          flex: 1,
          child: GridView.count(
              crossAxisCount: 2,
              controller: _scrollController,
              children: List.generate(productState.products.length, (index) {
                return ProductCard(
                  model: productState.products[index],
                );
              }))),
      Visibility(
        visible: productState.isLoading && productState.products.isNotEmpty,
        child: const SizedBox(
          height: 35,
          width: 35,
          child: CircularProgressIndicator(),
        ),
      )
    ]);
  }
}
