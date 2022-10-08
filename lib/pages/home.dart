import 'package:flutter/material.dart';
import 'package:flutterapi/pages/StockList.dart';

class HomeScrenn extends StatefulWidget {
  const HomeScrenn({Key? key}) : super(key: key);

  @override
  _HomeScrennState createState() => _HomeScrennState();
}

class _HomeScrennState extends State<HomeScrenn> {
  int _selectIndex = 0;
  List<Widget> pages = [
    StockListScreen(),
    Center(
      child: Text('Setting'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      body: pages[_selectIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.inventory,
                    size: 50,
                    color: Colors.white,
                  ),
                  Text(
                    'Inventory Workshop',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('stock'),
              onTap: () {
                selectIndex(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('setting'),
              onTap: () {
                selectIndex(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('logout'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }

  selectIndex(int index) {
    setState(() {
      _selectIndex = index;
      Navigator.pop(context);
    });
  }
}
