import 'dart:io';

class AdmobLyricEvangelique {
//region [ AdMob Android et iOS ]
//region [ AdMob Android ]
  static const String appIdAdMobAndroid = "ca-app-pub-5335107298173193~8238386628";
  static const String appOpenAdMobAndroid = "ca-app-pub-5335107298173193/8377987424";
  static const String bannerAdMobAndroid = "ca-app-pub-5335107298173193/1625539528";
  static const String interstitielAdMobAndroid = "ca-app-pub-5335107298173193/4299141612";
  static const String rewardedAdMobAndroid = "ca-app-pub-5335107298173193/2986059947";
  static const String rewardedInterstitielAdMobAndroid = "ca-app-pub-5335107298173193/5121931404";
  static const String natifAdvancedAdMobAndroid = "ca-app-pub-5335107298173193/2495768069";
//endregion

//region [ AdMob iOS ]
  static const String appIdAdMobIOS = "ca-app-pub-5335107298173193~9603439180";
  static const String appOpenAdMobIOS = "ca-app-pub-5335107298173193/1182686397";
  static const String bannerAdMobIOS = "ca-app-pub-5335107298173193/3940048962";
  static const String interstitielAdMobIOS = "ca-app-pub-5335107298173193/7556523050";
  static const String rewardedAdMobIOS = "ca-app-pub-5335107298173193/1481406581";
  static const String rewardedInterstitielAdMobIOS = "ca-app-pub-5335107298173193/4930359713";
  static const String natifAdvancedAdMobIOS = "ca-app-pub-5335107298173193/3617278043";
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