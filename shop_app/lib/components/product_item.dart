import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    //Provider que fornece as informações entre os widgets0, o argumento listen informa que 
    // o widget não esta escutando do provider mais, e não recebe atualização quando a notificação de atualização é acionada
    final product = Provider.of<Product>(context, listen: false);

    return ClipRRect(
      borderRadius: .circular(10),
      child: GridTile(
        footer: GridTileBar(
          title: Text(product.title, textAlign: .center),
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {
              product.toggleFavorite();
            },
            //o widget Consumer informa qual parte do componente ira receber a atualização
            // somente o que está dentro do consumer ira receber a notificação de atualização
            icon: Consumer<Product>(
              builder: (ctx, product, _) {
                return Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).colorScheme.secondary,
                );
              },
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        child: GestureDetector(
          child: Image.network(product.imageUrl, fit: .cover),
          onTap: () {
            Navigator.of(
              context,
            ).pushNamed(AppRoutes.productDetail, arguments: product);
          },
        ),
      ),
    );
  }
}
