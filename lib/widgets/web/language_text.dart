import 'package:flutter/material.dart';
import '../../colors.dart';

class LanguageText extends StatelessWidget {
  final String title;
  const LanguageText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // InkWell give a little splash effect when tapped
    return InkWell(
      onTap: () {},
      child: Text(
        title,
        style: const TextStyle(
          color: blueColor,
        ),
      ),
    );
  }
}
