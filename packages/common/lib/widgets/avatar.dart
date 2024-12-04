import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
    required this.image,
    this.large = false,
  });

  final String? image;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: large ? 32 : 24,
      backgroundColor: context.surfaceContainer,
      backgroundImage: image?.notBlank == null ? null : NetworkImage(image!),
    );
  }
}
