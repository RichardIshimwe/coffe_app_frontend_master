import 'dart:convert';

import 'package:coffee_master/datamodel.dart';
import 'package:http/http.dart' as http;

class Datamanager {
  List<Category>? _menu;
  List<ItemInCart> cart = [];

  fetchMenu() async {
    const url = "https://firtman.github.io/coffeemasters/api/menu.json";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var body = response.body;
      _menu = [];
      var decode = jsonDecode(body) as List<dynamic>;
      for (var json in decode) {
        _menu!.add(Category.fromJson(json));
      }
    }
  }

  Future<List<Category>> getMenu() async {
    if (_menu == null) {
      await fetchMenu();
    }
    return _menu!;
  }

  cartAdd(Product p) {
    print("cartAdd function called");
    bool found = false;
    for (var item in cart) {
      print("item.product.id ${item.product.id}");
      if (item.product.id == p.id) {
        item.quantity++;
        print("incremented existing item");
        found = true;
      }
    }
    if (!found) {
      print("added new item");
      cart.add(ItemInCart(product: p, quantity: 1));
    }
  }

  cartRemove(Product p) {
    for (var item in cart) {
      if (item.product.id == p.id) {
        item.quantity--;
        if (item.quantity == 0) {
          cart.remove(item);
        }
      }
    }
  }

  cartClear() {
    cart.clear();
  }

  double cartTotal() {
    double total = 0;
    for (var item in cart) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}
