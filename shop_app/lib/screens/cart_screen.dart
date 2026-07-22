import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/cart_item.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/order_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();
    return Scaffold(
      appBar: AppBar(title: Text('Carrinho')),
      body: Column(
        children: [
          Card(
            margin: .symmetric(horizontal: 15, vertical: 25),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text('Total', style: TextStyle(fontSize: 20)),
                  SizedBox(width: 10),
                  Chip(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    label: Text(
                      'R\$ ${cart.totalAmout.toStringAsFixed(2)}',
                      style: TextStyle(color: Theme.of(context).primaryTextTheme.headlineLarge?.color),
                    ),
                  ),
                  Spacer(),
                  TextButton(onPressed: () {
                    Provider.of<OrderList>(context,listen: false).addOrder(cart);
                    cart.clear();
                  }, style: TextButton.styleFrom(
                    textStyle: TextStyle( color: Theme.of(context).primaryColor)
                  ),child: Text('Comprar'))
                ],
              ),
            ),
          ),
          Expanded(child: ListView.builder(itemCount: items.length, itemBuilder: (ctx, i) {
            return CartItemWidget(cartItem: items[i]);
          }))
        ],
      ),
    );
  }
}
