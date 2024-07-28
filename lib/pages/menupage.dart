import 'package:flutter/material.dart';
import '../datamodel.dart';
import '../datamanager.dart';

class Menupage extends StatelessWidget {
  final Datamanager datamanager;
  const Menupage({super.key, required this.datamanager});

  @override
  Widget build(BuildContext context) {
    var productExample =
        Product(id: 1, name: "Cappuccino", price: 3.9, image: "");
    return ListView(
      children: [
        ProductItem(product: productExample , onAdd: () {

        },),
        ProductItem(product: productExample , onAdd: () {

        },),
        ProductItem(product: productExample , onAdd: () {

        },),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;

  const ProductItem({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("images/black_coffee.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("\$${product.price}"),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onAdd(product);
                    },
                    child: const Text("Add"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
