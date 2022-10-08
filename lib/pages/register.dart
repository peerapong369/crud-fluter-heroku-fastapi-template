import 'package:flutter/material.dart';
import 'package:flutterapi/componance/userForm.dart';
import 'package:flutterapi/networks/userAPI.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        child: UserForm(
          submit: register,
          textButton: 'Register',
        ),
      ),
    );
  }

  register(String username, String password) async {
    UserAPI userAPI = UserAPI();
    String msg = await userAPI.register(username: username, password: password);
    SnackBar snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
