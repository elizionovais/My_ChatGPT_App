import 'package:flutter/material.dart';

class AssistantWidget extends StatelessWidget {
  const AssistantWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.cyan[300],
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: 90,
      height: 90,
      child: const Icon(
        Icons.android,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}
