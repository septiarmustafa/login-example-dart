import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class button extends StatelessWidget {
  const button({
    super.key,
    required this.title,
    this.colorTitle,
    required this.action,
  });

  final String title;
  final Function() action;
  final Color? colorTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.blue,
        ),
        height: 40,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: colorTitle),
          ),
        ),
      ),
    );
  }
}
