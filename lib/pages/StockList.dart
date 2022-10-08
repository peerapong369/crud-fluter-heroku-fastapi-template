import 'package:flutter/material.dart';
import 'package:flutterapi/networks/inventoryAPI.dart';

import '../models/stock.dart';

class StockListScreen extends StatefulWidget {
  const StockListScreen({Key? key}) : super(key: key);

  @override
  _StockListScreenState createState() => _StockListScreenState();
}

class _StockListScreenState extends State<StockListScreen> {
  InventoryAPI inventoryAPI = InventoryAPI();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: inventoryAPI.getAll(),
        builder: (context, AsyncSnapshot<List<Stock?>?> snapshot) {
          if (snapshot.hasData) {
            List<Stock?>? stocks = snapshot.data;
            return ListView.builder(
                itemCount: stocks!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/editForm',
                        arguments: stocks[index],
                      ).then((value) {
                        setState(() {});
                      });
                    },
                    title: Text('${stocks[index]!.description}'),
                    subtitle: Text('${stocks[index]!.price}'),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // body: Container(
      //   child: ElevatedButton(
      //     child: Text('test api'),
      //     onPressed: () {},
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addForm').then((value) {
            //run code when back
            print('back');
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  //ดูข้อมูลที่ดึงมาจาก database
  //fetchdata() async {
  //  await inventoryAPI.getAll();
  //}
}
