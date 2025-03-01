import 'dart:io';

class AdmobChantDesperance {
//region [ AdMob Android et iOS ]
//region [ AdMob Android ]
  static const String appIdAdMobAndroid = "ca-app-pub-5335107298173193~4673438913";
  static const String appOpenAdMobAndroid = "ca-app-pub-5335107298173193/4662766405";
  static const String bannerAdMobAndroid = "ca-app-pub-5335107298173193/4143891652";
  static const String interstitielAdMobAndroid = "ca-app-pub-5335107298173193/8281511434";
  static const String rewardedAdMobAndroid = "ca-app-pub-5335107298173193/4342266420";
  static const String rewardedInterstitielAdMobAndroid = "ca-app-pub-5335107298173193/3022381678";
  static const String natifAdvancedAdMobAndroid = "ca-app-pub-5335107298173193/7044451380";
//endregion

//region [ AdMob iOS ]
  static const String appIdAdMobIOS = "ca-app-pub-5335107298173193~2913634687";
  static const String appOpenAdMobIOS = "ca-app-pub-5335107298173193/6661308008";
  static const String bannerAdMobIOS = "ca-app-pub-5335107298173193/6776858072";
  static const String interstitielAdMobIOS = "ca-app-pub-5335107298173193/8919805682";
  static const String rewardedAdMobIOS = "ca-app-pub-5335107298173193/4467325286";
  static const String rewardedInterstitielAdMobIOS = "ca-app-pub-5335107298173193/5288789653";
  static const String natifAdvancedAdMobIOS = "ca-app-pub-5335107298173193/4980560670";
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