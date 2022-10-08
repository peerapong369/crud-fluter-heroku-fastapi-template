import 'package:flutter/material.dart';
import 'package:flutterapi/models/stock.dart';

class StockForm extends StatelessWidget {
  final Function submit;
  final Stock stock;

  const StockForm({Key? key, required this.submit, required this.stock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _formkey = GlobalKey<FormState>();
    return Container(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            ListTile(
              title: TextFormField(
                initialValue: stock.description,
                onSaved: (String? value) {
                  stock.description = value!;
                },
                validator: _validateString,
                decoration:
                    InputDecoration(hintText: 'Name', labelText: 'Name'),
              ),
            ),
            ListTile(
              title: TextFormField(
                initialValue: stock.stock.toString(),
                onSaved: (String? value) {
                  stock.stock = double.parse(value!);
                },
                keyboardType: TextInputType.number,
                validator: _validateNumber,
                decoration:
                    InputDecoration(hintText: 'Stock', labelText: 'Stock'),
              ),
            ),
            ListTile(
              title: TextFormField(
                initialValue: stock.price.toString(),
                onSaved: (String? value) {
                  stock.price = double.parse(value!);
                },
                keyboardType: TextInputType.number,
                validator: _validateNumber,
                decoration:
                    InputDecoration(hintText: 'Price', labelText: 'Price'),
              ),
            ),
            ListTile(
              title: ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    //print('${stock.description} ${stock.stock} ${stock.price}');
                    submit(stock);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  String? _validateString(String? value) {
    if (value == null || value == '') {
      return 'Please fill data';
    }
    return null;
  }

  String? _validateNumber(String? value) {
    if (value == null || value == '') {
      return 'Please fill data';
    }
    if (double.tryParse(value) == null) {
      return 'Invalid Number';
    }
    return null;
  }
}
