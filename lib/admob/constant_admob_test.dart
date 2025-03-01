import 'dart:io';

class AdmobChantChoraleEtGroupe {
//region [ AdMob Android et iOS ]
//region [ AdMob Android - TEST ]
  static const String appIdAdMobAndroidTEST = "ca-app-pub-3940256099942544~3347511713";
  static const String appOpenAdMobAndroidTEST = "ca-app-pub-3940256099942544/9257395921";
  static const String bannerAdMobAndroidTEST = "ca-app-pub-3940256099942544/6300978111";
  static const String interstitielAdMobAndroidTEST = "ca-app-pub-3940256099942544/1033173712";
  static const String rewardedAdMobAndroidTEST = "ca-app-pub-3940256099942544/5224354917";
  static const String rewardedInterstitielAdMobAndroidTEST ="ca-app-pub-3940256099942544/5354046379";
  static const String natifAdvancedAdMobAndroidTEST = "ca-app-pub-3940256099942544/2247696110";
//endregion

//region [ AdMob iOS - TEST ]
  static const String appIdAdMobIOsTEST = "ca-app-pub-3940256099942544~1458002511";
  static const String appOpenAdMobIOsTEST = "ca-app-pub-3940256099942544/5662855259";
  static const String bannerAdMobIOsTEST = "ca-app-pub-3940256099942544/2934735716";
  static const String interstitielAdMobIOsTEST = "ca-app-pub-3940256099942544/4411468910";
  static const String rewardedAdMobIOsTEST = "ca-app-pub-3940256099942544/1712485313";
  static const String rewardedInterstitielAdMobIOsTEST = "ca-app-pub-3940256099942544/6978759866";
  static const String natifAdvancedAdMobIOsTEST = "ca-app-pub-3940256099942544/3986624511";
//endregion

//region [ AdMob For Get Id For Android or iOS / in Test Or Not ]

  static String appOpenAdTestAdUnitId = Platform.isAndroid ? appOpenAdMobAndroidTEST : appOpenAdMobIOsTEST;

  static String testAppId =
  Platform.isAndroid ? appIdAdMobAndroidTEST : appIdAdMobIOsTEST;

  static String bannerTestAdUnitId = Platform.isAndroid ? bannerAdMobAndroidTEST : bannerAdMobIOsTEST;

  static String interstitialAdTestAdUnitId = Platform.isAndroid
      ? interstitielAdMobAndroidTEST
      : interstitielAdMobIOsTEST;

  static String rewardedInterstitialAdTestAdUnitId = Platform.isAndroid
      ? rewardedInterstitielAdMobAndroidTEST
      : rewardedInterstitielAdMobIOsTEST;

  static String rewardedVideoAdTestAdUnitId =
  Platform.isAndroid ? rewardedAdMobAndroidTEST : rewardedAdMobIOsTEST;

  static String nativeAdTestAdUnitId = Platform.isAndroid
      ? natifAdvancedAdMobAndroidTEST
      : natifAdvancedAdMobIOsTEST;
//endregion
//endregion
}