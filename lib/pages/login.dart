import 'package:flutter/material.dart';
import 'package:flutterapi/componance/userForm.dart';
import 'package:flutterapi/networks/userAPI.dart';

import '../models/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(50),
              width: 150,
              height: 150,
              child: FlutterLogo(),
            ),
            UserForm(
              submit: login,
              textButton: 'Login',
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Need an Account'),
            )
          ],
        ),
      ),
    );
  }

  login(String username, String password) async {
    UserAPI userAPI = UserAPI();
    Login? login = await userAPI.login(username: username, password: password);
    print(login);
    if (login == null) {
      SnackBar snackBar = SnackBar(content: Text('Invalid user'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    userAPI.storeToken(token: login.accessToken);
    //Navigator.pushNamed(context, '/home');
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    SnackBar snackBar = SnackBar(content: Text('Wellcome to my App'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
