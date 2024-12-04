import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  const CustomInkWell({
    super.key,
    this.child,
    this.color,
    this.image,
    this.splashColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius = 0,
    this.outlineColor,
    this.outlineWidth,
    this.elevation,
    this.dropShadow,
    this.size,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.padding,
    this.pressedOpacity,
    this.enabled = true,
    this.onTap,
    this.borderRadiusDetails,
    this.dropShadows,
  });

  const CustomInkWell.rounded({
    super.key,
    this.child,
    this.color,
    this.image,
    this.splashColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius = 10,
    this.outlineColor,
    this.outlineWidth,
    this.elevation,
    this.dropShadow,
    this.size,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.padding,
    this.pressedOpacity,
    this.enabled = true,
    this.onTap,
    this.borderRadiusDetails,
    this.dropShadows,
  });

  final Widget? child;
  final Color? color;
  final ImageProvider? image;
  final Color? splashColor;
  final Color? borderColor;
  final double? borderWidth;
  final double borderRadius;
  final Color? outlineColor;
  final double? outlineWidth;
  final double? elevation;
  final double? dropShadow;
  final double? size;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusDirectional? borderRadiusDetails;
  final List<BoxShadow>? dropShadows;

  /// `0.4` is recommended for buttons and `0.6` for cards/images
  final double? pressedOpacity;
  final bool enabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      margin: margin,
      child: Material(
        type: color == null && outlineWidth == null
            ? MaterialType.transparency
            : MaterialType.canvas,
        color: outlineWidth != null ? outlineColor ?? context.outline : null,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadiusDetails ??
              BorderRadiusDirectional.all(
                Radius.circular(borderRadius + (outlineWidth ?? 0)),
              ),
        ),
        child: Container(
          margin: EdgeInsets.all(outlineWidth ?? 0),
          decoration: dropShadow != null || dropShadows != null
              ? ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadiusDetails ??
                        BorderRadiusDirectional.all(
                          Radius.circular(borderRadius),
                        ),
                  ),
                  shadows: dropShadows ??
                      [
                        BoxShadow(
                          color: context.outline,
                          blurRadius: dropShadow!,
                          offset: const Offset(0, 2),
                        ),
                      ],
                )
              : null,
          child: Material(
            type:
                color == null ? MaterialType.transparency : MaterialType.canvas,
            color: color ?? Colors.transparent,
            clipBehavior: Clip.antiAlias,
            elevation: elevation ?? 0,
            shadowColor: context.shadow.withOpacity(0.4),
            shape: RoundedRectangleBorder(
              side: borderWidth != null
                  ? BorderSide(
                      color: borderColor ?? context.outline,
                      width: borderWidth!,
                    )
                  : BorderSide.none,
              borderRadius: borderRadiusDetails ??
                  BorderRadiusDirectional.all(Radius.circular(borderRadius)),
            ),
            child: onTap == null || !enabled
                ? _child
                : pressedOpacity != null
                    ? CupertinoButton(
                        onPressed: onTap,
                        pressedOpacity: pressedOpacity,
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        child: _child,
                      )
                    : InkWell(
                        onTap: onTap,
                        splashColor: splashColor,
                        highlightColor: splashColor?.withOpacity(0.1),
                        child: _child,
                      ),
          ),
        ),
      ),
    );
  }

  Widget get _child => SizedBox(
        width: size ?? width,
        height: size ?? height,
        child: _image ??
            Container(
              padding: padding,
              child: child,
            ),
      );

  Widget? get _image => image != null
      ? Ink(
          padding: padding,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image!,
              fit: BoxFit.cover,
            ),
          ),
          child: child,
        )
      : null;
}

extension TooltipWidget on Widget {
  Widget tooltip(
    String? message, {
    bool enabled = true,
    Key? key,
  }) =>
      enabled && message?.notBlank != null
          ? Tooltip(
              key: key,
              message: message,
              child: this,
            )
          : this;
}
