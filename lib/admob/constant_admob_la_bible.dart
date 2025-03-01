import 'dart:io';

class AdmobLaBible {
//region [ AdMob Android et iOS ]
//region [ AdMob Android ]
  static const String appIdAdMobAndroid = "ca-app-pub-5335107298173193~9860458512";
  static const String appOpenAdMobAndroid = "ca-app-pub-5335107298173193/5559251693";
  static const String bannerAdMobAndroid = "ca-app-pub-5335107298173193/7516887270";
  static const String interstitielAdMobAndroid = "ca-app-pub-5335107298173193/7680538808";
  static const String rewardedAdMobAndroid = "ca-app-pub-5335107298173193/9449394975";
  static const String rewardedInterstitielAdMobAndroid = "ca-app-pub-5335107298173193/6060256409";
  static const String natifAdvancedAdMobAndroid = "ca-app-pub-5335107298173193/9923558765";
//endregion

//region [ AdMob iOS ]
  static const String appIdAdMobIOS = "ca-app-pub-5335107298173193~4738658612";
  static const String appOpenAdMobIOS = "ca-app-pub-5335107298173193/8148582552";
  static const String bannerAdMobIOS = "ca-app-pub-5335107298173193/3727107079";
  static const String interstitielAdMobIOS = "ca-app-pub-5335107298173193/8877991438";
  static const String rewardedAdMobIOS = "ca-app-pub-5335107298173193/4367900781";
  static const String rewardedInterstitielAdMobIOS = "ca-app-pub-5335107298173193/8111704675";
  static const String natifAdvancedAdMobIOS = "ca-app-pub-5335107298173193/8566128102";
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