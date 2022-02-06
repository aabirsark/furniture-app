import 'package:flutter/material.dart';
import 'package:furniture_app/app/app_colors.dart';
import 'package:furniture_app/meta/home.dart';

void main() => runApp(const FurnitureApp());

class FurnitureApp extends StatelessWidget {
  const FurnitureApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Furniture App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "gilfory",
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              elevation: 0.0,
              color: Colors.transparent,
              titleTextStyle: TextStyle(color: Colors.black),
              iconTheme: IconThemeData(color: Colors.black))),
      home: const HomePage(),
    );
  }
}
