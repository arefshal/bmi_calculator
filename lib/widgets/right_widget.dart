import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RightWidget extends StatelessWidget {
  double width;
  RightWidget({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 40,
          width: width,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
