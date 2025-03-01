import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'brain_dev_google_ads_method_channel.dart';

abstract class BrainDevGoogleAdsPlatform extends PlatformInterface {
  /// Constructs a BrainDevGoogleAdsPlatform.
  BrainDevGoogleAdsPlatform() : super(token: _token);

  static final Object _token = Object();

  static BrainDevGoogleAdsPlatform _instance = MethodChannelBrainDevGoogleAds();

  /// The default instance of [BrainDevGoogleAdsPlatform] to use.
  ///
  /// Defaults to [MethodChannelBrainDevGoogleAds].
  static BrainDevGoogleAdsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BrainDevGoogleAdsPlatform] when
  /// they register themselves.
  static set instance(BrainDevGoogleAdsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
