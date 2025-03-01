import 'dart:io';

class AdmobChantLyric {
//region [ AdMob Android et iOS ]
//region [ AdMob Android ]
  static const String appIdAdMobAndroid = "ca-app-pub-5335107298173193~2112624686";
  static const String appOpenAdMobAndroid = "ca-app-pub-5335107298173193/1289834893";
  static const String bannerAdMobAndroid = "ca-app-pub-5335107298173193/2435395608";
  static const String interstitielAdMobAndroid = "ca-app-pub-5335107298173193/2934751760";
  static const String rewardedAdMobAndroid = "ca-app-pub-5335107298173193/6302215353";
  static const String rewardedInterstitielAdMobAndroid = "ca-app-pub-5335107298173193/7496150591";
  static const String natifAdvancedAdMobAndroid = "ca-app-pub-5335107298173193/6350589886";
//endregion

//region [ AdMob iOS ]
  static const String appIdAdMobIOS = "ca-app-pub-5335107298173193~2602916565";
  static const String appOpenAdMobIOS = "ca-app-pub-5335107298173193/1641188683";
  static const String bannerAdMobIOS = "ca-app-pub-5335107298173193/8991957872";
  static const String interstitielAdMobIOS = "ca-app-pub-5335107298173193/4159540812";
  static const String rewardedAdMobIOS = "ca-app-pub-5335107298173193/8015025348";
  static const String rewardedInterstitielAdMobIOS = "ca-app-pub-5335107298173193/5369343416";
  static const String natifAdvancedAdMobIOS = "ca-app-pub-5335107298173193/4056261748";
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