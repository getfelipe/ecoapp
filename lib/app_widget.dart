import 'package:flutter/material.dart';
import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';

class AppWidget extends StatelessWidget{
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.brown),
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
