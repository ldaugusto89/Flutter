import 'package:flutter/material.dart';

abstract class ShopAppDialogs {
  static Future<bool> confirmDialog({
    required BuildContext context,
    required String title,
    required String content,
    String textOK = 'Sim',
    String textCancel = 'Não',
  }) async {
    final isConfirm = await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(textCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(textOK),
          ),
        ],
      ),
    );
    return isConfirm ?? false;
  }
}
