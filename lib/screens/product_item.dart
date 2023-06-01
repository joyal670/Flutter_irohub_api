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
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.none),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.network(pImage),
                ),
                Text(
                  pName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'RS - $pPrice',
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Size - $pSize',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
