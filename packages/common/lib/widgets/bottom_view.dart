import 'package:flutter/material.dart';

class BottomView extends StatelessWidget {
  const BottomView({
    this.children,
    this.padding = const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
    this.direction = Axis.horizontal,
    super.key,
  });

  final List<Widget>? children;
  final EdgeInsets padding;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(),
          if (children != null)
            Padding(
              padding: padding,
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.end,
                direction: direction,
                children: children!,
              ),
            ),
        ],
      ),
    );
  }
}
