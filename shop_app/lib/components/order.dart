import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/order.dart';

class OrderWidget extends StatefulWidget {
  final Order order;
  const OrderWidget({super.key, required this.order});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date)
            ),
            trailing: IconButton(onPressed: (){
              setState(() {
                _expanded = !_expanded;
              });
            }, icon: Icon(Icons.expand_more, color: Colors.grey[700],)),
          ),
          if(_expanded)
          Container(
            padding: .symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            height: (widget.order.products.length * 25.0) + 10,
            child: ListView(
              children: widget.order.products.map((product) {
                return Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(product.productName, style: TextStyle(fontSize: 18, fontWeight: .bold),),
                    Text('${product.quatity}x R\$ ${product.price}',style: TextStyle(fontSize: 18, fontWeight:  .bold),),
                  ],
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}