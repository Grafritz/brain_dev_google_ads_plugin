
import 'brain_dev_google_ads_platform_interface.dart';

export 'package:brain_dev_google_ads/src/ads_config.dart';

import 'package:brain_dev_google_ads/app_open_ads.dart';
import 'package:brain_dev_google_ads/src/ads_config.dart';
import 'package:brain_dev_google_ads/config/dependencies_tools.dart';

/// Démarre les publicités. [config] dit au plugin quelle application c'est (choix des identifiants AdMob en
/// publication) : il ne lit plus la configuration de `brain_dev_tools`.
Future initBrainDevGoogleAds({required AdsConfig config}) async {
  BrainDevAdsConfig.current = config;
  initBrainDevGoogleAdsDependencies();
  await mobileAdsInstanceInitialize();
}

class BrainDevGoogleAds {
  Future<String?> getPlatformVersion() {
    return BrainDevGoogleAdsPlatform.instance.getPlatformVersion();
  }
}
