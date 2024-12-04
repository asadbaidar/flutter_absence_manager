import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.title,
    this.customTitle,
    this.subtitle,
    this.customSubtitle,
    this.leading,
    this.trailing,
    this.titleStyle,
    this.subtitleStyle,
    this.titleMaxLines,
    this.subtitleMaxLines,
    this.verticalSpacing = 0,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final String? title;
  final Widget? customTitle;
  final String? subtitle;
  final Widget? customSubtitle;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final int? titleMaxLines;
  final int? subtitleMaxLines;
  final double verticalSpacing;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final hasTitle = title != null || customTitle != null;
    final hasSubtitle = subtitle != null || customSubtitle != null;
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (leading != null) ...[
          leading!,
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasTitle)
                DefaultTextStyle(
                  style: titleStyle ??
                      context.bodyMedium?.onPrimaryContainer(context) ??
                      const TextStyle(),
                  maxLines: titleMaxLines,
                  overflow: titleMaxLines == 1
                      ? TextOverflow.ellipsis
                      : TextOverflow.clip,
                  child: customTitle ?? Text(title!),
                ),
              if (hasTitle && hasSubtitle) SizedBox(height: verticalSpacing),
              if (hasSubtitle)
                DefaultTextStyle(
                  style: subtitleStyle ??
                      context.bodyMedium
                          ?.onPrimaryContainer(context)
                          .focused() ??
                      const TextStyle(),
                  maxLines: subtitleMaxLines,
                  overflow: subtitleMaxLines == 1
                      ? TextOverflow.ellipsis
                      : TextOverflow.clip,
                  child: customSubtitle ?? Text(subtitle!),
                ),
            ],
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: 8),
          trailing!,
        ],
      ],
    );
  }
}
