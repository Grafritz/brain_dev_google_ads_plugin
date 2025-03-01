import 'dart:io';

class AdmobChantDesperanceLegacy {
//region [ AdMob Android et iOS ]
//region [ AdMob Android ]
  static const String appIdAdMobAndroid = "ca-app-pub-5335107298173193~8348374287";
  static const String appOpenAdMobAndroid = "ca-app-pub-5335107298173193/9058820726";
  static const String bannerAdMobAndroid = "ca-app-pub-5335107298173193/9094743075";
  static const String interstitielAdMobAndroid = "ca-app-pub-5335107298173193/5993641866";
  static const String rewardedAdMobAndroid = "ca-app-pub-5335107298173193/8571998890";
  static const String rewardedInterstitielAdMobAndroid = "ca-app-pub-5335107298173193/1846808449";
  static const String natifAdvancedAdMobAndroid = "ca-app-pub-5335107298173193/7965230902";
//endregion

//region [ AdMob iOS ]
  static const String appIdAdMobIOS = "ca-app-pub-5335107298173193~6296894197";
  static const String appOpenAdMobIOS = "ca-app-pub-5335107298173193/5099657742";
  static const String bannerAdMobIOS = "ca-app-pub-5335107298173193/6732008468";
  static const String interstitielAdMobIOS = "ca-app-pub-5335107298173193/5937833367";
  static const String rewardedAdMobIOS = "ca-app-pub-5335107298173193/1160412731";
  static const String rewardedInterstitielAdMobIOS = "ca-app-pub-5335107298173193/4720383798";
  static const String natifAdvancedAdMobIOS = "ca-app-pub-5335107298173193/5562692171";
//endregion

//region [ AdMob For Get Id For Android or iOS / in Test Or Not ]
  static String get appIdAdMob {
    return Platform.isAndroid ? appIdAdMobAndroid : appIdAdMobIOS;
  }

  static String get bannerAdUnitId {
    return Platform.isAndroid ? bannerAdMobAndroid : bannerAdMobIOS;
  }

  static String get appOpenAdUnitId {
    return Platform.isAndroid ? appOpenAdMobAndroid : appOpenAdMobIOS;
  }

  static String get interstitielAdUnitId {
    return Platform.isAndroid ? interstitielAdMobAndroid : interstitielAdMobIOS;
  }

  static String get rewardedInterstitialAdUnitId {
    return Platform.isAndroid ? rewardedInterstitielAdMobAndroid : rewardedInterstitielAdMobIOS;
  }

  static String get rewardedVideoAdUnitId {
    return Platform.isAndroid ? rewardedAdMobAndroid : rewardedAdMobIOS;
  }

  static String get natifAdvancedAdUnitId {
    return Platform.isAndroid ? natifAdvancedAdMobAndroid : natifAdvancedAdMobIOS;
  }
//endregion
//endregion
}