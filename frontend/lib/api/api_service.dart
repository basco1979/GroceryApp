import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shop/models/category.dart';
import 'package:shop/models/login_request_model.dart';
import 'package:shop/models/login_response_model.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_filter.dart';
//import 'package:shop/models/product_model.dart';
import 'package:shop/models/register_request_model.dart';
import 'package:shop/models/register_response_model.dart';
import 'package:shop/services/shared_service.dart';

import '../config.dart';

final apiService = Provider((ref) => APIservice());

class APIservice {
  static var client = http.Client();

  static Future<bool> login(String email, String password) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.loginAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"email": email, "password": password}),
    );
    if (response.statusCode == 200) {
      //SHARED
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> registerUser(
      String fullname, String email, String password) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.registerAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
          {"fullname": fullname, "email": email, "password": password}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Basic ${loginDetails!.data.token}'
    };
    var url = Uri.http(Config.apiURL, Config.userProfileAPI);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      //SHARED
      return response.body;
    } else {
      return "";
    }
  }

  /*  static Future<List<ProductModel>?> getProducts() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.productURL);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return productsFromJson(data["data"]);
    } else {
      return null;
    }
  } 

  static Future<bool> saveProduct(
      ProductModel model, bool isEditMode, bool isFileSelected) async {
    var productUrl = Config.productURL;
    if (isEditMode) {
      productUrl = productUrl + "/" + model.id.toString();
    }
    var url = Uri.http(Config.apiURL, Config.productURL);
    var requestMethod = isEditMode ? "PUT" : "POST";
    var request = http.MultipartRequest(requestMethod, url);
    request.fields["productName"] = model.productName!;
    request.fields["productPrice"] = model.productPrice!.toString();
    if (model.productImage! != null && isFileSelected) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
          'productImage', model.productImage!);
      request.files.add(multipartFile);
    }

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteProduct(productId) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.productURL + "/" + productId);
    var response = await client.delete(
      url,
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }*/

  Future<List<Category>?> getCategories(page, pageSize) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString()
    };

    var url = Uri.http(Config.apiURL, Config.categoryAPI);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return categoriesFromJson(data["data"]);
    } else {
      return null;
    }
  }

  Future<List<Product>?> getProducts(
      ProductFilterModel productFilterModel) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    Map<String, String> queryString = {
      'page': productFilterModel.paginationModel.page.toString(),
      'pageSize': productFilterModel.paginationModel.pagesize.toString()
    };

    if (productFilterModel.categoryId != null) {
      queryString["categoryId"] = productFilterModel.categoryId!;
    }
    if (productFilterModel.sortBy != null) {
      queryString["sort"] = productFilterModel.sortBy!;
    }

    var url = Uri.http(Config.apiURL, Config.productURL);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return productsFromJson(data["data"]);
    } else {
      return null;
    }
  }
}
