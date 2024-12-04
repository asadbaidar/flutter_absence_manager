import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomProgress extends StatelessWidget {
  const CustomProgress({
    super.key,
    required this.size,
    this.centered = true,
    this.color,
  });

  const CustomProgress.small({
    super.key,
    this.centered = true,
    this.color,
  }) : size = 18.0;

  const CustomProgress.medium({
    super.key,
    this.centered = true,
    this.color,
  }) : size = 28.0;

  const CustomProgress.large({
    super.key,
    this.centered = true,
    this.color,
  }) : size = 34.0;

  final double size;
  final bool centered;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: centered ? null : size,
      child: Center(
        child: SizedBox.square(
          dimension: size,
          child: context.platform == TargetPlatform.iOS
              ? CupertinoActivityIndicator(
                  radius: size / 2,
                  color: color?.notDark,
                )
              : CircularProgressIndicator(
                  strokeWidth: size * 0.09,
                  color: color,
                ),
        ),
      ),
    );
  }
}
