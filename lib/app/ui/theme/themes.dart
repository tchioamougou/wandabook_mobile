
import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.grey.shade100,
      cardColor: Colors.white,
      scaffoldBackgroundColor: Colors.grey[200],
      shadowColor: Colors.grey,
      iconTheme: const IconThemeData(color: Colors.black, size: 30),
       buttonTheme: ButtonThemeData(
        buttonColor: Colors.orange,
      ));
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.grey[900],
    cardColor: Colors.grey[900],
    scaffoldBackgroundColor: Colors.grey[800],
    shadowColor: Colors.grey,
    iconTheme: const IconThemeData(color: Colors.white, size: 30),
    buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
    listTileTheme: ListTileThemeData(),
  );
}
