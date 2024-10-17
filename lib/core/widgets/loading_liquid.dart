import 'package:flutter/material.dart';
import 'package:linkat_center_dashboard/core/utils/contant.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class CustomLiquidProgressIndicator extends StatefulWidget {
  const CustomLiquidProgressIndicator({super.key});

  @override
  State<CustomLiquidProgressIndicator> createState() =>
      _CustomLiquidProgressIndicatorState();
}

class _CustomLiquidProgressIndicatorState
    extends State<CustomLiquidProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 120,
        width: 120,
        child: LiquidCircularProgressIndicator(
          value: 0.7,
          valueColor: AlwaysStoppedAnimation(primaryColor
              // Colors.blue[300]!
              ),
          backgroundColor: Colors.white,
          borderColor: Colors.transparent,
          borderWidth: 0,
          direction: Axis.vertical,
          center: const Text(
            "Loading...",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
