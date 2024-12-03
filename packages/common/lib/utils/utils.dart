import 'package:common/common.dart';
import 'package:flutter/material.dart';

export 'http_client.dart';

extension PhonePlatform on BuildContext {
  bool get isPhone => isAndroid || isIOS;
}
