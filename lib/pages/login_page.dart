import 'package:cab_app/widgets/app_text_bold.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppTextBold(
          text: "LOGIN PAGE",
          color: Colors.black,
        ),
      ),
    );
  }
}
