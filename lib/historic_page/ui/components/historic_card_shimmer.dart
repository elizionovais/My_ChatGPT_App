
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HistoricCardShimmer extends StatelessWidget {
  final double height;
  final Color baseColor;
  final Color highlightColor;
  final Color backgroundColor;

  const HistoricCardShimmer({
    Key? key,
    required this.height,
    this.baseColor = Colors.cyan,
    this.highlightColor = Colors.white,
    this.backgroundColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
                width: 170,
                child: Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                    color: backgroundColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 10,
                width: 120,
                child: Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                    color: backgroundColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
            width: 20,
            child: Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                color: backgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
