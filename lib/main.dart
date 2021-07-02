import 'package:dicoding/pages/detail.dart';
import 'package:dicoding/pages/inputNama.dart';
import 'package:dicoding/pages/listProduk.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomeScreen(),
      '/inputNama': (context) => InputNama(),
      '/listProduct': (context) => ListProduct(),
      '/detail': (context) => Detail(),
    },
  ));
}