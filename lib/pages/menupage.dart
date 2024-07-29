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
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var categories = snapshot.data! as List<Category>;
          // return Text("with length of ${categories.length} ");
          return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(categories[index].name),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: categories[index].products.length,
                      itemBuilder: (context, productIndex) {
                        var product = categories[index].products[productIndex];
                        return ProductItem(
                            product: product,
                            onAdd: (addedProduct) {
                              datamanager.cartAdd(addedProduct);
                              print("added ${addedProduct.name}");
                            });
                      },
                    )
                  ],
                );
              });
        } else {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Text("there was an error while rendering data");
          } else {
            return Text("Loading...");
          }
        }
      },
      future: datamanager.getMenu(),
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
            Image.network(product.imageUrl),
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
