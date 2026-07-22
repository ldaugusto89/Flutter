import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/product_list.dart';
import 'package:shop_app/utils/app_routes.dart';
import 'package:shop_app/utils/confim_dialog.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  
  const ProductItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList productList = Provider.of(context);
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(product.imageUrl)),
      title: Text(product.name),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).pushNamed(AppRoutes.productForm, arguments: product);
              },
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () async{
                   if (await ShopAppDialogs.confirmDialog(
                      context: context,
                      title: 'Remoção Produto',
                      content: 'Tem certeza que deseja deletar o produto?',
                      textOK: 'Sim',
                      textCancel: 'Não',
                    )) {
                      return productList.deleteProduct(product);
                    }
                    return;
                },
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
