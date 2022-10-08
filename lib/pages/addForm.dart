import 'package:flutter/material.dart';
import 'package:flutterapi/componance/stockForm.dart';
import 'package:flutterapi/networks/inventoryAPI.dart';

import '../models/stock.dart';

class AddForm extends StatefulWidget {
  const AddForm({Key? key}) : super(key: key);

  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  Stock stock = Stock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Form'),
      ),
      body: StockForm(
        stock: stock,
        submit: submit,
      ),
    );
  }

  submit(Stock stock) async {
    InventoryAPI inventoryAPI = InventoryAPI();
    Stock? res = await inventoryAPI.creatStock(stock: stock);
    if (res == null) {
      print('Something went wrong');
    } else {
      print(res.id);
    }
    Navigator.pop(context);
  }
}
