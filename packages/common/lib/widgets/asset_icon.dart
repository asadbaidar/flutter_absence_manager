import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AssetIcon extends StatelessWidget {
  const AssetIcon(
    this.icon, {
    this.type,
    this.size,
    this.color,
    super.key,
  });

  const AssetIcon.monotone(
    this.icon, {
    this.size,
    this.color,
    super.key,
  }) : type = AssetIconType.mt;

  const AssetIcon.multicolor(
    this.icon, {
    this.size,
    super.key,
  })  : type = AssetIconType.mc,
        color = null;

  final AssetIcons icon;
  final double? size;
  final Color? color;
  final AssetIconType? type;

  @override
  Widget build(BuildContext context) {
    if (icon == AssetIcons.blank) return const SizedBox.shrink();
    final type = this.type ?? icon.type;
    return icon.isSVG
        ? _AssetIconVector(
            icon,
            type: type,
            size: size,
            color: color,
          )
        : _AssetIconImage(
            icon,
            type: type,
            size: size,
            color: color,
          );
  }
}

class _AssetIconVector extends StatelessWidget {
  const _AssetIconVector(
    this.icon, {
    required this.type,
    this.size,
    this.color,
  });

  final AssetIcons icon;
  final double? size;
  final Color? color;
  final AssetIconType type;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    return SvgPicture.asset(
      icon.byTypeOrMonotone(type),
      width: size ?? iconTheme.size,
      height: size ?? iconTheme.size,
      colorFilter: type == AssetIconType.mc
          ? null
          : ColorFilter.mode(
              color ?? iconTheme.color ?? context.primary,
              BlendMode.srcIn,
            ),
    );
  }
}

class _AssetIconImage extends StatelessWidget {
  const _AssetIconImage(
    this.icon, {
    required this.type,
    this.size,
    this.color,
  });

  final AssetIcons icon;
  final double? size;
  final Color? color;
  final AssetIconType type;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    return Image.asset(
      icon.byTypeOrMonotone(type),
      width: size ?? iconTheme.size,
      height: size ?? iconTheme.size,
      color: type == AssetIconType.mc
          ? null
          : color ?? iconTheme.color ?? context.primary,
    );
  }
}
