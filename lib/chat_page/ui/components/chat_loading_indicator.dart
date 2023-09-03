import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ChatLoadingIndicator extends StatelessWidget {
  const ChatLoadingIndicator({
    super.key,
    this.backgroundColor = Colors.orange,
    this.colors = const [Colors.black],
    this.indicatorType = Indicator.ballPulse,
  });

  final Color backgroundColor;
  final List<Color> colors;
  final Indicator indicatorType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 40),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: LoadingIndicator(
        indicatorType: indicatorType,
        colors: colors,
        backgroundColor: backgroundColor,
      ),
    );
  }
}