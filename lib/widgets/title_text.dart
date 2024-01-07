import 'package:coinite/resources/dimens.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  TitleText({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: TEXT_HEADING_X1,
      ),
    );
  }
}
