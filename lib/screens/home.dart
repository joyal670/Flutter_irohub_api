import 'package:api_example/data/api/api.dart';
import 'package:api_example/screens/product_item.dart';
import 'package:flutter/material.dart';

import '../model/get_product_response/datum.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ApiClass.instance.getProducts();
    });

    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 233, 233, 1),
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: ApiClass.instance.productNotifier,
              builder: (context, List<Datum> newProduct, _) {
                return GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  padding: const EdgeInsets.all(10),
                  children: List.generate(newProduct.length, (index) {
                    final product =
                        ApiClass.instance.productNotifier.value[index];
                    return ProductItem(
                        pName: product.pname,
                        pSize: product.size,
                        pPrice: product.prize,
                        pImage: product.image);
                  }),
                );
              })),
    );
  }
}
