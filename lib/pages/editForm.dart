import 'package:flutter/material.dart';
import 'package:flutterapi/componance/stockForm.dart';
import 'package:flutterapi/networks/inventoryAPI.dart';

import '../models/stock.dart';

class EditForm extends StatefulWidget {
  const EditForm({Key? key}) : super(key: key);

  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  @override
  Widget build(BuildContext context) {
    Stock stock = ModalRoute.of(context)!.settings.arguments as Stock;
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Form'),
        ),
        body: Column(
          children: [
            StockForm(
              stock: stock,
              submit: submit,
            ),
            ListTile(
              title: ElevatedButton(
                onPressed: () {
                  delete(stock.id);
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Text('Delete'),
              ),
            )
          ],
        ));
  }

  submit(Stock stock) async {
    InventoryAPI inventoryAPI = InventoryAPI();
    Stock? res = await inventoryAPI.updateStock(stock: stock);
    if (res == null) {
      print('Something went wrong');
    } else {
      Navigator.pop(context);
    }
  }

  delete(int? id) async {
    InventoryAPI inventoryAPI = InventoryAPI();
    String? msg = await inventoryAPI.deleteStock(id: id!);
    print(msg);
    Navigator.pop(context);
  }
}
