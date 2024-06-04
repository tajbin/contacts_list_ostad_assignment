import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Ui/screens/contact_list_screen.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List App',
      debugShowCheckedModeBanner: false,
      home: const ContactListScreen(),
      theme: _lightTheme(),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
        appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey,
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
    ),
inputDecorationTheme:  InputDecorationTheme(
  hintStyle: TextStyle(
    color: Colors.grey.withOpacity(0.7)
  ),
  border: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey)
  )
),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          fixedSize: const Size.fromWidth(double.maxFinite),
         shape:  RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(3),
         ),
          padding: EdgeInsets.symmetric(vertical: 12)
        )
      )
    );
  }
}
