import 'dart:convert';

class LoginResponseModel {
  late final String message;
  late final Data data;

  LoginResponseModel({
    required this.message,
    required this.data,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  late final String fullname;
  late final String email;
  late final String date;
  late final String id;
  late final String token;

  Data({
    required this.fullname,
    required this.email,
    required this.date,
    required this.id,
    required this.token,
  });

  Data.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    date = json['date'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullname'] = fullname;
    _data['email'] = email;
    _data['date'] = date;
    _data['id'] = id;
    _data['token'] = token;
    return _data;
  }
}
