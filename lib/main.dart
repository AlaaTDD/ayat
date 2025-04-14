import 'package:flutter/material.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  home: Scaffold(
    body: Center(child: Text("Ayat")),
  ),
  ));
}

