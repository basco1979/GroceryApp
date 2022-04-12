import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/components/product_card.dart';
import 'package:shop/models/pagination.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_filter.dart';

import '../providers.dart';

class HomeProductWidget extends ConsumerWidget {
  const HomeProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> list = List<Product>.empty(growable: true);

    return Container(
      color: const Color(0xffF4F7FA),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 15),
                child: Text("Top 10 products",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: _prodductList(ref),
          )
        ],
      ),
    );
  }

  Widget _prodductList(WidgetRef ref) {
    final products = ref.watch(homeProductsProvider(ProductFilterModel(
      paginationModel: PaginationModel(page: 1, pagesize: 10),
    )));
    return products.when(
        data: (list) {
          return _buildProductList(list!);
        },
        error: (_, __) {
          return const Center(
            child: const Text("ERROR"),
          );
        },
        loading: () => CircularProgressIndicator());
  }

  Widget _buildProductList(List<Product> products) {
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          var data = products[index];
          return GestureDetector(
            onTap: () {},
            child: ProductCard(
              model: data,
            ),
          );
        },
      ),
    );
  }
}
