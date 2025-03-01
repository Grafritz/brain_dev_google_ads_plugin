import 'dart:io';

class AdmobChantChoraleEtGroupe {
//region [ AdMob Android et iOS ]
//region [ AdMob Android ]
  static const String appIdAdMobAndroid = "ca-app-pub-5335107298173193~6136651602";
  static const String appOpenAdMobAndroid = "ca-app-pub-5335107298173193/8598692040";
  static const String bannerAdMobAndroid = "ca-app-pub-5335107298173193/7202760415";
  static const String interstitielAdMobAndroid = "ca-app-pub-5335107298173193/9607779510";
  static const String rewardedAdMobAndroid = "ca-app-pub-5335107298173193/5640035575";
  static const String rewardedInterstitielAdMobAndroid = "ca-app-pub-5335107298173193/5328092844";
  static const String natifAdvancedAdMobAndroid = "ca-app-pub-5335107298173193/6413520401";
//endregion

//region [ AdMob iOS ]
  static const String appIdAdMobIOS = "ca-app-pub-5335107298173193~4290044391";
  static const String appOpenAdMobIOS = "ca-app-pub-5335107298173193/2504056980";
  static const String bannerAdMobIOS = "ca-app-pub-5335107298173193/8253216423";
  static const String interstitielAdMobIOS = "ca-app-pub-5335107298173193/1707989379";
  static const String rewardedAdMobIOS = "ca-app-pub-5335107298173193/4858115718";
  static const String rewardedInterstitielAdMobIOS = "ca-app-pub-5335107298173193/6973977319";
  static const String natifAdvancedAdMobIOS = "ca-app-pub-5335107298173193/6941353572";
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