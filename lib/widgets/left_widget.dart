import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LeftWidget extends StatelessWidget {
  double width;
  LeftWidget({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: width,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
