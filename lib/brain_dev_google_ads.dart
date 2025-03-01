
import 'brain_dev_google_ads_platform_interface.dart';

import 'package:brain_dev_google_ads/app_open_ads.dart';
import 'package:brain_dev_google_ads/config/dependencies_tools.dart';

Future initBrainDevGoogleAds() async {
  initBrainDevGoogleAdsDependencies();
  await mobileAdsInstanceInitialize();
}

class BrainDevGoogleAds {
  Future<String?> getPlatformVersion() {
    return BrainDevGoogleAdsPlatform.instance.getPlatformVersion();
  }
}
