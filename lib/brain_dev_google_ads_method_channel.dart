import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'brain_dev_google_ads_platform_interface.dart';

/// An implementation of [BrainDevGoogleAdsPlatform] that uses method channels.
class MethodChannelBrainDevGoogleAds extends BrainDevGoogleAdsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('brain_dev_google_ads');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
