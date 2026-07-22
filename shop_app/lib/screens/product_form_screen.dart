import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/product_list.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({super.key});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _formData = <String, Object>{};

  @override
  void initState() {
    super.initState();
    _imageUrlFocus.addListener(updateImage);
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    if(_formData.isEmpty){
      final arg = ModalRoute.of(context)?.settings.arguments;

      if(arg != null) {
        final product = arg as Product;
        _formData['id'] = product.id;
        _formData['name'] = product.name;
        _formData['price'] = product.price;
        _formData['description'] = product.description;
        _formData['imageUrl'] = product.imageUrl;

        _imageUrlController.text = product.imageUrl;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _imageUrlFocus.removeListener(updateImage);
    _imageUrlFocus.dispose();
  }

  void updateImage() {
    setState(() {});
  }

  bool isValidImageUrl(String url) {
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    bool endsWithFile = url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.jpg') ||
        url.toLowerCase().endsWith('.jpeg');
    return isValidUrl && endsWithFile;
  }

  void _submitForm() {
    
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    Provider.of<ProductList>(context, listen: false).saveProduct(_formData);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Produto'),
        actions: [IconButton(onPressed: _submitForm, icon: Icon(Icons.save))],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              initialValue: _formData['name']?.toString(),
              decoration: InputDecoration(labelText: 'Nome Produto'),
              textInputAction: TextInputAction.next,
              onSaved: (name) => _formData['name'] = name ?? '',
              validator: (name) {
                final prodname = name ?? '';
                if (prodname.trim().isEmpty) {
                  return 'Obrigatorio informar um nome';
                }

                if (prodname.trim().length < 3) {
                  return 'O nome de ter 3 caracteres ou mais';
                }
                return null;
              },
            ),
            TextFormField(
              initialValue: _formData['price']?.toString(),
              decoration: InputDecoration(labelText: 'Preço'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSaved: (price) =>
                  _formData['price'] = double.parse(price ?? '0'),
              validator: (prec) {
                final priceString = prec ?? '';
                final price = double.tryParse(priceString) ?? -1;

                if (price <= 0) {
                  return 'Obrigatorio informar um preço';
                }

                return null;
              },
            ),
            TextFormField(
              initialValue: _formData['description']?.toString(),
              decoration: InputDecoration(labelText: 'Descrição'),
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              onSaved: (description) =>
                  _formData['description'] = description ?? '',
              validator: (desc) {
                final description = desc ?? '';
                if (description.trim().isEmpty) {
                  return 'Obrigatorio informar uma descrição';
                }

                if (description.trim().length < 3) {
                  return 'O nome de ter 10 caracteres ou mais';
                }
                return null;
              },
            ),
            Row(
              crossAxisAlignment: .end,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Url da IMG Produto',
                    ),
                    focusNode: _imageUrlFocus,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.url,
                    controller: _imageUrlController,
                    onFieldSubmitted: (_) => _submitForm(),
                    onSaved: (imageUrl) =>
                        _formData['imageUrl'] = imageUrl ?? '',
                    validator: (imageUrl) {
                      final imgUrl = imageUrl ?? '';

                      if (!isValidImageUrl(imgUrl)) {
                        return 'Obrigatorio informar uma imagem para o produto';
                      }

                      return null;

                    },
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  margin: .only(top: 10, left: 10),
                  decoration: BoxDecoration(
                    border: .all(color: Colors.grey, width: 1),
                  ),
                  alignment: .center,
                  child: _imageUrlController.text.isEmpty
                      ? Text('Informe a URL')
                      : FittedBox(
                          child: Image.network(
                            _imageUrlController.text,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
