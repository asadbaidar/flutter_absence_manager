import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.tooltip,
    this.color,
    this.backgroundColor,
    this.backgroundImage,
    this.borderColor,
    this.outlineColor,
    this.size = 40,
    this.iconSize,
    this.dropShadow,
    this.elevation,
    this.borderWidth,
    this.borderRadius,
    this.outlineWidth,
    this.circle = false,
    this.enabled = true,
    this.padding,
    this.onPressed,
    this.dropShadows,
  })  : pressedOpacity = null,
        floating = false;

  const CustomIconButton.cupertino({
    super.key,
    required this.icon,
    this.tooltip,
    this.color,
    this.backgroundColor,
    this.backgroundImage,
    this.borderColor,
    this.outlineColor,
    this.size = 40,
    this.iconSize,
    this.pressedOpacity = 0.4,
    this.dropShadow,
    this.elevation,
    this.borderWidth,
    this.borderRadius,
    this.outlineWidth,
    this.circle = false,
    this.enabled = true,
    this.padding,
    this.onPressed,
    this.dropShadows,
  }) : floating = false;

  const CustomIconButton.floating({
    super.key,
    required this.icon,
    this.tooltip,
    this.color,
    this.backgroundColor,
    this.backgroundImage,
    this.borderColor,
    this.outlineColor,
    this.size = 40,
    this.iconSize,
    this.dropShadow = 8,
    this.elevation,
    this.borderWidth,
    this.borderRadius,
    this.outlineWidth,
    this.circle = true,
    this.enabled = true,
    this.padding,
    this.onPressed,
    this.dropShadows,
  })  : pressedOpacity = null,
        floating = true;

  const CustomIconButton.circle({
    super.key,
    required this.icon,
    this.tooltip,
    this.color,
    this.backgroundColor,
    this.backgroundImage,
    this.borderColor,
    this.outlineColor,
    this.size = 40,
    this.iconSize,
    this.dropShadow,
    this.elevation,
    this.borderWidth,
    this.borderRadius,
    this.outlineWidth,
    this.enabled = true,
    this.padding,
    this.onPressed,
    this.dropShadows,
  })  : pressedOpacity = null,
        floating = false,
        circle = true;

  final Widget icon;
  final String? tooltip;
  final Color? color;
  final Color? backgroundColor;
  final ImageProvider? backgroundImage;
  final Color? borderColor;
  final Color? outlineColor;
  final double size;
  final double? iconSize;
  final double? pressedOpacity;
  final double? dropShadow;
  final double? elevation;
  final double? borderWidth;
  final double? borderRadius;
  final double? outlineWidth;
  final bool floating;
  final bool circle;
  final bool enabled;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final List<BoxShadow>? dropShadows;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: enabled ? onPressed : null,
      color: backgroundColor ?? (floating ? context.surface : null),
      image: backgroundImage,
      dropShadow: dropShadow,
      dropShadows: dropShadows,
      elevation: elevation,
      borderColor: borderColor,
      borderWidth: borderWidth,
      outlineColor: outlineColor,
      outlineWidth: outlineWidth,
      pressedOpacity: pressedOpacity,
      padding: padding ?? EdgeInsets.zero,
      size: size,
      borderRadius: borderRadius ?? (circle ? size : 10),
      child: Center(
        child: IconTheme(
          data: context.iconTheme.copyWith(
            size: iconSize,
            color: color,
          ),
          child: icon,
        ),
      ),
    ).tooltip(tooltip);
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.color,
    this.onPressed,
  });

  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return _PopButton(
      icon: AssetIcons.arrow_back,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      color: color,
      onPressed: onPressed,
    );
  }
}

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({
    super.key,
    this.color,
    this.onPressed,
  });

  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return _PopButton(
      icon: AssetIcons.cross_mark,
      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      color: color,
      onPressed: onPressed,
    );
  }
}

class _PopButton extends StatelessWidget {
  const _PopButton({
    required this.icon,
    this.color,
    this.tooltip,
    this.onPressed,
  });

  final AssetIcons icon;
  final Color? color;
  final String? tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.center,
      child: CustomIconButton(
        tooltip: tooltip,
        onPressed: onPressed ??
            () => context
              ..unfocus()
              ..pop(),
        icon: AssetIcon.monotone(icon),
        color: color,
      ),
    );
  }
}
