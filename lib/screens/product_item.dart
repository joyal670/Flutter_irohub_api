import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final pName;
  final pSize;
  final pPrice;
  final pImage;

  const ProductItem({
    super.key,
    required this.pName,
    required this.pSize,
    required this.pPrice,
    required this.pImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        child: Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              border: Border.all(style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Container(
                height: 100,
                child: Image.network(pImage),
              ),
              Text(pName),
              Text(pPrice),
              Text(pSize),
            ],
          ),
        ),
      ),
    );
  }
}
