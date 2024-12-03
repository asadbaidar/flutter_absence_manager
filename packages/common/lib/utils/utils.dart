import 'package:common/common.dart';
import 'package:flutter/material.dart';

export 'http_client.dart';

extension PhonePlatform on BuildContext {
  bool get isPhone => isAndroid || isIOS;
}

extension FailureOrEmptyData<T> on Data<T> {
  bool get isFailureOrEmpty => isFailure || (isLoaded && isEmpty);
}

extension ScreenSizeMediaQuery on BuildContext {
  /// Return true if the screen is tall phone size
  bool get isMiniScreen => screenSize.width < 300;

  /// Return true if the screen is normal phone size
  bool get isSmallScreen => screenSize.width < 600;

  /// Return true if the screen is tablet size
  bool get isMediumScreen => screenSize.width > 600 && screenSize.width < 990;

  /// Return true if the screen is desktop size
  bool get isLargeScreen => screenSize.width > 990;

  /// Return true if the screen is tall or normal phone size
  bool get isMiniOrSmallScreen => isMiniScreen || isSmallScreen;

  /// Return true if the screen is tablet or desktop size
  bool get isMediumOrLargeScreen => isMediumScreen || isLargeScreen;
}
