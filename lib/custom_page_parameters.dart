import 'package:flutter/material.dart';

class CustomPageParameters {
  CustomPageParameters({
    required this.question,
    required this.children,
    required this.actions,
  });

  final String question;
  final List<Widget> children;
  final List<Widget> actions;
}
