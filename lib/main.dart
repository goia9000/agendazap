import 'package:agendazap/homepage.dart';
import 'package:flutter/material.dart';


void main () {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Homepage(),
    title: 'Agenda Zap',
    theme: ThemeData(
      primarySwatch: Colors.green,

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    ),
  ));
}