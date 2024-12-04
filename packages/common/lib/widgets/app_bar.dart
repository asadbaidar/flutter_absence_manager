import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locale/locale.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.customTitle,
    this.leading,
    this.bottom,
    this.actions,
    this.leadingWidth,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.scrolledUnderElevation,
    this.toolbarHeight,
    this.bottomHeight,
    this.actionSpacing = 16,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.showLeading = true,
    this.centerTitle,
  });

  const CustomAppBar.transparent({
    super.key,
    this.title,
    this.customTitle,
    this.leading,
    this.bottom,
    this.actions,
    this.leadingWidth,
    this.foregroundColor,
    this.elevation = 0,
    this.scrolledUnderElevation = 0,
    this.toolbarHeight,
    this.bottomHeight,
    this.actionSpacing = 16,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.showLeading = true,
    this.centerTitle,
  }) : backgroundColor = Colors.transparent;

  factory CustomAppBar.noBar({
    SystemUiOverlayStyle? systemOverlayStyle,
  }) =>
      CustomAppBar(
        systemOverlayStyle: systemOverlayStyle,
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      );

  final String? title;
  final Widget? customTitle;
  final Widget? leading;
  final Widget? bottom;
  final List<Widget>? actions;
  final double? leadingWidth;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final double? scrolledUnderElevation;
  final double? toolbarHeight;
  final double? bottomHeight;
  final double actionSpacing;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool showLeading;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    final leading = implyLeading(context)
        ? this.leading ??
            (useCloseButton(context)
                ? const CustomCloseButton()
                : const CustomBackButton())
        : null;
    return AppBar(
      title: customTitle ?? (title != null ? Text(title!) : null),
      leading: leading,
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(_bottomHeight),
              child: bottom!,
            )
          : null,
      actions: actions?.isNotEmpty == true
          ? actionSpacing > 0
              ? actions!
                  .expand((e) => [e, SizedBox(width: actionSpacing)])
                  .toList()
              : actions
          : null,
      leadingWidth: leadingWidth ?? 64,
      titleSpacing: leading == null ? 16 : 0,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      scrolledUnderElevation: scrolledUnderElevation,
      toolbarHeight: _toolbarHeight,
      titleTextStyle: titleTextStyle,
      systemOverlayStyle: systemOverlayStyle ??
          (backgroundColor == null
              ? null
              : backgroundColor!.isLight
                  ? context.lightStatusBar
                  : context.darkStatusBar),
      automaticallyImplyLeading: showLeading,
      centerTitle: centerTitle,
    );
  }

  double? get _titleHeight =>
      $cast<PreferredSizeWidget>(customTitle)?.preferredSize.height;

  double get _bottomHeight =>
      bottomHeight ??
      $cast<PreferredSizeWidget>(bottom)?.preferredSize.height ??
      0;

  double get _toolbarHeight =>
      toolbarHeight ?? _titleHeight ?? kDefaultToolbarHeight;

  @override
  Size get preferredSize => Size.fromHeight(_toolbarHeight + _bottomHeight);

  ModalRoute<dynamic>? route(BuildContext context) => ModalRoute.of(context);

  PageRoute<dynamic>? pageRoute(BuildContext context) => $cast(route(context));

  bool implyLeading(BuildContext context) =>
      showLeading && (route(context)?.impliesAppBarDismissal == true);

  bool useCloseButton(BuildContext context) =>
      pageRoute(context)?.fullscreenDialog ?? false;
}

class WindowTitle extends StatelessWidget {
  const WindowTitle({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Title(
      title: '${LocaleStrings.appName} | $title',
      color: context.primary,
      child: child,
    );
  }
}
