import 'package:flutter/material.dart';
import 'package:shop/api/api_service.dart';
import 'package:shop/services/shared_service.dart';
import 'package:shop/widgets/widget_home_categories.dart';
import 'package:shop/widgets/widget_home_products.dart';
import 'package:shop/widgets/widget_home_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*       appBar: AppBar(
        title: Text("Shop"),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                SharedService.logout(context);
              },
              icon: const Icon(Icons.logout),
              color: Colors.black)
        ],
      ),
      backgroundColor: Colors.grey[200],
 */
      body: Container(
        child: ListView(
          children: const [
            HomeSliderWidget(),
            HomeCategoriesWidget(),
            HomeProductWidget()
          ],
        ),
      ),
    );
  }

  Widget userProfile() {
    return FutureBuilder(
      future: APIservice.getUserProfile(),
      builder: (BuildContext context, AsyncSnapshot<String> model) {
        if (model.hasData) {
          return Center(
            child: Text(model.data!),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
