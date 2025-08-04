import 'package:flutter/material.dart';

enum TitleType {
  h1,
  h2,
  h3,
  h4,
  h5,
}

class AppTitle extends StatelessWidget {
  const AppTitle({super.key, required this.title, this.type = TitleType.h1});

  final String title;
  final TitleType type;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: switch (type) {
        TitleType.h1 => 24,
        TitleType.h2 => 20,
        TitleType.h3 => 18,
        TitleType.h4 => 16,
        TitleType.h5 => 14,
      },
    ),);
  }
}