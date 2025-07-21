
import 'package:flutter/material.dart';
import 'package:flutter_unit_tests/data/bank_inherited.dart';
import 'package:flutter_unit_tests/screens/home.dart';
import 'package:flutter_unit_tests/themes/purple_theme.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: purpleTheme,
      debugShowCheckedModeBanner: false,
      home: BankInherited(child: const Home()),
    );
  }
}
