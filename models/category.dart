import 'package:flutter/material.dart';

class Category1 {
  const Category1(
      {required this.title, this.color = Colors.lightGreen, required this.id});
  final String id;
  final String title;
  final Color color;
}
