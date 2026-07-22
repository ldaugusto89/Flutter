import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) {
        return showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Exclusão de item!'),
            content: Text('Deseja remover o item do carrinho?'),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(ctx).pop(false);
              }, child: Text('Não')),
              TextButton(onPressed: () {
                Navigator.of(ctx).pop(true);
              }, child: Text('Sim')),
            ],
          ),
        );
      },
      onDismissed: (_) {
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(cartItem.productId);
      },
      background: Container(
        alignment: .centerRight,
        padding: .only(right: 20),
        color: Theme.of(context).colorScheme.error,
        margin: const .symmetric(horizontal: 15, vertical: 4),
        child: Icon(Icons.delete, size: 40, color: Colors.white),
      ),
      child: Card(
        margin: const .symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const .all(5),
                child: FittedBox(child: Text('${cartItem.price}')),
              ),
            ),
            title: Text(cartItem.productName),
            subtitle: Text('Total: R\$ ${cartItem.price * cartItem.quatity}'),
            trailing: Text('${cartItem.quatity}x'),
          ),
        ),
      ),
    );
  }
}
