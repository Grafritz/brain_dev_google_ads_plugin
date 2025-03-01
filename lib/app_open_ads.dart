import 'package:brain_dev_google_ads/admob/constant_admob.dart';
import 'package:brain_dev_tools/tools/check_platform.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

mobileAdsInstanceInitialize() async {
  if (checkPlatform.isMobile) {
    MobileAds.instance.initialize();
  }
  await createAppOpenAd(showAfter: true);
}

//region [ AppOpen App ]
AppOpenAd? appOpenAd;
Future createAppOpenAd({bool showAfter = false}) async {
  if (checkPlatform.isMobile) {
    await AppOpenAd.load(
      adUnitId: getAppOpenAdUnitId(),
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
        logCat('ad is loaded');
        appOpenAd = ad;
        if (showAfter) {
          showAppOpenAd();
        }
      }, onAdFailedToLoad: (error) {
        logCat('ad failed to load $error');
      }),
    );
  }
}

void showAppOpenAd() {
  if (appOpenAd == null) {
    logCat('trying tto show before loading');
    createAppOpenAd();
    return;
  }
  appOpenAd!.fullScreenContentCallback =
      FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
        logCat('onAdShowedFullScreenContent');
      }, onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        logCat('failed to load $error');
        appOpenAd = null;
        createAppOpenAd();
      }, onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        logCat('dismissed');
        appOpenAd = null;
        createAppOpenAd();
      });
  appOpenAd!.show();
}
//endregion
