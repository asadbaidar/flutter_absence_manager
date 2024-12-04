import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    this.text,
    this.textStyle,
    this.icon,
    this.color,
    this.pressedOpacity = 0.4,
    this.padding,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : bold = false;

  const CustomActionButton.bold({
    super.key,
    this.text,
    this.textStyle,
    this.icon,
    this.color,
    this.pressedOpacity = 0.4,
    this.padding,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : bold = true;

  final String? text;
  final TextStyle? textStyle;
  final Widget? icon;
  final Color? color;
  final bool bold;
  final double? pressedOpacity;
  final EdgeInsetsGeometry? padding;
  final bool loading;
  final bool enabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? context.secondary;
    final foreground = enabled ? color : color.focused;
    if (loading) return CustomProgress.small(color: color);

    return CustomInkWell(
      onTap: onPressed,
      pressedOpacity: pressedOpacity,
      padding: padding,
      borderRadius: pressedOpacity != null ? 0 : 8,
      enabled: enabled,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: IconTheme(
                data: context.localIconTheme.copyWith(color: foreground),
                child: icon!,
              ),
            ),
          Text(
            text ?? '',
            style: (textStyle ?? context.bodyLarge)?.withGoogleFont(
              color: foreground,
              fontWeight: bold ? FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }
}
