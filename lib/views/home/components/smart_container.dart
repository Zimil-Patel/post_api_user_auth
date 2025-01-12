import 'package:flutter/material.dart';

Widget smartContainer(Widget child) {
  return Container(
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.white12,
      borderRadius: BorderRadius.circular(20),
    ),
    child: child,
  );
}