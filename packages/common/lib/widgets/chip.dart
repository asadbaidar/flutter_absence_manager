import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomInputChip extends StatelessWidget {
  const CustomInputChip({
    super.key,
    required this.text,
    this.icon,
    required this.selected,
    required this.onSelected,
  });

  final String text;
  final Widget? icon;
  final bool selected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    return InputChip(
      label: Text(
        text,
        style: context.labelSmall?.withColor(
          selected ? context.onSecondaryContainer : context.onSurfaceVariant,
        ),
      ),
      avatar: icon != null
          ? IconTheme(
              data: IconThemeData(
                color: selected
                    ? context.onSecondaryContainer
                    : context.onSurfaceVariant,
              ),
              child: icon!,
            )
          : null,
      avatarBoxConstraints:
          const BoxConstraints.tightFor(width: 28, height: 16),
      selected: selected,
      onSelected: onSelected,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      labelPadding:
          EdgeInsetsDirectional.only(end: 6, start: icon != null ? 0 : 6),
      side: BorderSide(
        color: selected ? context.secondaryFixedDim : context.surfaceDim,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      selectedColor: context.secondaryContainer,
      backgroundColor: context.surfaceContainer,
      checkmarkColor: context.onSecondary,
      showCheckmark: false,
    );
  }
}

class CustomTextChip extends StatelessWidget {
  const CustomTextChip({
    super.key,
    required this.text,
    this.color,
    this.textStyle,
    this.onTap,
  });

  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? text.color;
    return CustomInkWell(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      borderRadius: 16,
      color: color.opacity10,
      child: Text(
        text,
        style: (textStyle ?? context.bodySmall)?.withColor(color),
      ),
    );
  }
}
