
import 'package:flutter/material.dart';

class AssistantWidget extends StatelessWidget {
  const AssistantWidget({
    super.key,
    this.isAddWidget = false,
    required this.onTap,
    this.onLongPress,
  });

  final bool isAddWidget;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: isAddWidget ? null : onLongPress,
      child: Container(
        margin: const EdgeInsets.only(
          left: 10,
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: isAddWidget ? Colors.grey[400] : Colors.cyan[400],
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
        width: 80,
        height: 80,
        child: Icon(
          isAddWidget ? Icons.add : Icons.android,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
