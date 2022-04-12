import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/pages/login_page.dart';
import 'package:shop/pages/products_page.dart';
import 'package:shop/product.dart';
import 'package:shop/product_add_edit.dart';
import 'package:shop/pages/register_page.dart';
import 'package:shop/services/shared_service.dart';

import 'pages/home_page.dart';

Widget _defaultHome = const LoginPage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool _result = await SharedService.isLoggedIn();
  if (_result) {
    _defaultHome = const HomePage();
  }
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: <String, WidgetBuilder>{
          '/': (context) => _defaultHome,
          //    '/add-product': (context) => const ProductAddEdit(),
          // '/edit-product': (context) => const ProductAddEdit(),
          '/home': (context) => const HomePage(),
          '/products': (BuildContext context) => const ProductsPage(),
          '/login': (BuildContext context) => const LoginPage(),
          '/register': (BuildContext context) => const RegisterPage(),
        });
  }
}
