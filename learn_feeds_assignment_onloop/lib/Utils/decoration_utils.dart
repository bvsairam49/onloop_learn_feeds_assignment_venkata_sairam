import 'package:flutter/material.dart';

var containerCardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
          color: const Color(0xff939399).withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 10,
          offset: const Offset(0, 3))
    ]);

BoxDecoration boxDecoration(Color fillColor, Color borderColor) {
  return BoxDecoration(
      color: fillColor,
      border: Border.all(
        color: borderColor,
        width: 1.0,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(6)));
}
