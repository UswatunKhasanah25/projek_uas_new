import 'package:flutter/material.dart';
import 'package:projek_uas_new/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: LoginPage(),
    );
  }
}