import 'dart:io';

class AdmobPlanifMax {
//region [ AdMob Android et iOS ]
//region [ AdMob Android ]
  static const String appIdAdMobAndroid = "ca-app-pub-5335107298173193~5881802122";
  static const String appOpenAdMobAndroid = "ca-app-pub-5335107298173193/4312072723";
  static const String bannerAdMobAndroid = "ca-app-pub-5335107298173193/7125938320";
  static const String interstitielAdMobAndroid = "ca-app-pub-5335107298173193/9402143106";
  static const String rewardedAdMobAndroid = "ca-app-pub-5335107298173193/4499774987";
  static const String rewardedInterstitielAdMobAndroid = "ca-app-pub-5335107298173193/1654119796";
  static const String natifAdvancedAdMobAndroid = "ca-app-pub-5335107298173193/5401793114";
//endregion

//region [ AdMob iOS ]
  static const String appIdAdMobIOS = "ca-app-pub-5335107298173193~6177213964";
  static const String appOpenAdMobIOS = "ca-app-pub-5335107298173193/9952909077";
  static const String bannerAdMobIOS = "ca-app-pub-5335107298173193/2237968952";
  static const String interstitielAdMobIOS = "ca-app-pub-5335107298173193/8611805618";
  static const String rewardedAdMobIOS = "ca-app-pub-5335107298173193/4700582390";
  static const String rewardedInterstitielAdMobIOS = "ca-app-pub-5335107298173193/2154310105";
  static const String natifAdvancedAdMobIOS = "ca-app-pub-5335107298173193/5210221429";
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