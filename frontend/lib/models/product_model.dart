List<ProductModel> productsFromJson(dynamic str) =>
    List<ProductModel>.from((str).map((x) => ProductModel.fromJson(x)));

class ProductModel {
  late String? id;
  late String? productName;
  late String? productDescription;
  late String? productImage;
  late int? productPrice;

  ProductModel({
    this.id,
    this.productName,
    this.productDescription,
    this.productImage,
    this.productPrice,
  });
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    productName = json["productName"];
    productName = json["productDescription"];
    productName = json["productImage"];
    productName = json["productPrice"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data["id"] = id;
    _data["productName"] = productName;
    _data["productDescription"] = productDescription;
    _data["productImage"] = productImage;
    _data["productPrice"] = productPrice;

    return _data;
  }
}
