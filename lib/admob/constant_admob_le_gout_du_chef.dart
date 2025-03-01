import 'dart:io';

class AdmobLeGoutDuChef {
//region [ AdMob Android et iOS ]
//region [ AdMob Android ]
  static const String appIdAdMobAndroid = "ca-app-pub-5335107298173193~4862186773";
  static const String appOpenAdMobAndroid = "ca-app-pub-5335107298173193/2719679400";
  static const String bannerAdMobAndroid = "ca-app-pub-5335107298173193/2339965216";
  static const String interstitielAdMobAndroid = "ca-app-pub-5335107298173193/7505534126";
  static const String rewardedAdMobAndroid = "ca-app-pub-5335107298173193/8627044109";
  static const String rewardedInterstitielAdMobAndroid ="ca-app-pub-5335107298173193/2253207442";
  static const String natifAdvancedAdMobAndroid = "ca-app-pub-5335107298173193/6000880761";
//endregion

//region [ AdMob iOS ]
  static const String appIdAdMobIOS = "ca-app-pub-5335107298173193~7560502301";
  static const String appOpenAdMobIOS = "ca-app-pub-5335107298173193/3537937057";
  static const String bannerAdMobIOS = "ca-app-pub-5335107298173193/2061635759";
  static const String interstitielAdMobIOS = "ca-app-pub-5335107298173193/9748554089";
  static const String rewardedAdMobIOS = "ca-app-pub-5335107298173193/3461475195";
  static const String rewardedInterstitielAdMobIOS = "ca-app-pub-5335107298173193/4774556860";
  static const String natifAdvancedAdMobIOS = "ca-app-pub-5335107298173193/4496227404";
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