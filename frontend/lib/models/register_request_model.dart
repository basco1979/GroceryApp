class RegisterRequestModel {
  RegisterRequestModel({
    this.fullname,
    this.password,
    this.email,
  });
  late final String? fullname;
  late final String? password;
  late final String? email;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullname'] = fullname;
    _data['password'] = password;
    _data['email'] = email;
    return _data;
  }
}
