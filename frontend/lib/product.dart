/* import 'package:flutter/material.dart';
import 'package:shop/models/product_item.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/services/api_service.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<ProductModel> products = List<ProductModel>.empty(growable: true);
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    products.add(ProductModel(
        id: "1",
        productName: "Haldiram",
        productDescription: "Haldiram is a yet",
        productImage:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder/svg1665px-No-Image-Placeholder.svg.png",
        productPrice: 500));

    products.add(ProductModel(
        id: "2",
        productName: "Namkeen",
        productDescription: "Namkeen 🇼🇸",
        productImage:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder/svg1665px-No-Image-Placeholder.svg.png",
        productPrice: 1000));
  }

  Widget ProductList(products) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.green,
                    minimumSize: const Size(88, 36),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                onPressed: () {},
                child: const Text("Add Product"),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    model: products[index],
                    onDelete: (ProductModel model) {
                      setState(() {
                        isApiCallProcess = true;
                      });
                      APIservice.deleteProduct(model.id).then((response) {
                        setState(() {
                          isApiCallProcess = false;
                        });
                      });
                    },
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products AppBar"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: ProgressHUD(
        child: loadProducts(),
        inAsyncCall: isApiCallProcess,
        opacity: .3,
        key: UniqueKey(),
      ),
    );
  }

  Widget loadProducts() {
    return FutureBuilder(
      future: APIservice.getProducts(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>?> model) {
        if (model.hasData) {
          return ProductList(model.data);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
 */