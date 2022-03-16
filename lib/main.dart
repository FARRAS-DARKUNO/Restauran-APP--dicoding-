import 'package:flutter/material.dart';
import 'package:restaurant_app/deatail_menu.dart';
import 'deatail_menu.dart';
import 'text_theme.dart';
import 'home.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: myTextTheme,
      ),
      home: DetailMenu(idRestorant: 'fnfn8mytkpmkfw1e867'),
    );
  }
}
