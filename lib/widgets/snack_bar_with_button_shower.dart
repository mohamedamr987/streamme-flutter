import 'package:flutter/material.dart';
import '../main.dart';

void snackBarWithButtonShower(String text, void Function() onPressed )
{
  final snackBar = SnackBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),)
      ),
    backgroundColor: Colors.grey.shade300,
    behavior: SnackBarBehavior.floating,
    content:  Text(text ,style: const TextStyle(color: Colors.black,),),
    action: SnackBarAction(onPressed: onPressed, label: "Show", textColor: Colors.black,),
  );
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
}