import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

export 'http_client.dart';

const int kMiniScreenWidth = 300;
const int kSmallScreenWidth = 600;
const int kMediumScreenWidth = 750;
const int kLargeScreenWidth = 990;

extension ScreenSizeContext on BuildContext {
  /// Return true if the screen is tall phone size or smaller
  bool get isMiniScreen => screenSize.width < kMiniScreenWidth;

  /// Return true if the screen is normal phone size or smaller
  bool get isBelowSmallScreen => screenSize.width < kSmallScreenWidth;

  /// Return true if the screen is normal or large tablet size
  bool get isBetweenSmallLargeScreen =>
      screenSize.width > kSmallScreenWidth &&
      screenSize.width < kLargeScreenWidth;

  /// Return true if the screen is above normal phone size
  bool get isAboveSmallScreen => screenSize.width > kSmallScreenWidth;

  /// Return true if the screen is above normal tablet size
  bool get isAboveMediumScreen => screenSize.width > kMediumScreenWidth;

  /// Return true if the screen is above large tablet size or desktop size
  bool get isAboveLargeScreen => screenSize.width > kLargeScreenWidth;
}

extension ScreenSizeMediaQuery on MediaQueryData {
  /// Return true if the screen is tall phone size or smaller
  bool get isMiniScreen => size.width < kMiniScreenWidth;

  /// Return true if the screen is normal phone size or smaller
  bool get isBelowSmallScreen => size.width < kSmallScreenWidth;

  /// Return true if the screen is normal or large tablet size
  bool get isBetweenSmallLargeScreen =>
      size.width > kSmallScreenWidth && size.width < kLargeScreenWidth;

  /// Return true if the screen is above normal phone size
  bool get isAboveSmallScreen => size.width > kSmallScreenWidth;

  /// Return true if the screen is above normal tablet size
  bool get isAboveMediumScreen => size.width > kMediumScreenWidth;

  /// Return true if the screen is above large tablet size or desktop size
  bool get isAboveLargeScreen => size.width > kLargeScreenWidth;
}

extension PhonePlatformContext on BuildContext {
  bool get isPhoneOrTablet => platform.isPhoneOrTablet;
}

extension PhonePlatform on TargetPlatform {
  bool get isPhoneOrTablet => isAndroid || isIOS;
}

extension FailureOrEmptyData<T> on Data<T> {
  bool get isFailureOrEmpty => isFailure || (isLoaded && isEmpty);
}

extension UpdateLocale on BuildContext {
  void updateLocale([Locale? newLocale]) {
    final locale = newLocale ?? this.locale;
    setLocale(locale);
    Intl.defaultLocale = locale.toString();
  }
}
