import 'dart:io';

import 'package:brain_dev_tools/config/app_config.dart';
import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';

class AdmobCustom
{
  GoogleAdsModel get googleAds => EnvironmentVariable.googleAds;
//region [ AdMob Android et iOS ]
//region [ AdMob Android ]
  static String appIdAdMobAndroid = TypeSafeConversion.nullSafeString(EnvironmentVariable.googleAds.appIdAdMobAndroid);
  static String appOpenAdMobAndroid = TypeSafeConversion.nullSafeString(EnvironmentVariable.googleAds.appOpenAdMobAndroid);
  static String bannerAdMobAndroid = TypeSafeConversion.nullSafeString(EnvironmentVariable.googleAds.bannerAdMobAndroid);
  static String interstitielAdMobAndroid = TypeSafeConversion.nullSafeString(EnvironmentVariable.googleAds.interstitielAdMobAndroid);
  static String rewardedAdMobAndroid = TypeSafeConversion.nullSafeString(EnvironmentVariable.googleAds.rewardedAdMobAndroid);
  static String rewardedInterstitielAdMobAndroid = TypeSafeConversion.nullSafeString(EnvironmentVariable.googleAds.rewardedInterstitielAdMobAndroid);
  static String natifAdvancedAdMobAndroid = TypeSafeConversion.nullSafeString(EnvironmentVariable.googleAds.natifAdvancedAdMobAndroid);
//endregion

//region [ AdMob iOS ]
  static String appIdAdMobIOS = TypeSafeConversion.nullSafeString(EnvironmentVariable.googleAds.appIdAdMobIOS);
  static String appOpenAdMobIOS = TypeSafeConversion.nullSafeString(EnvironmentVariable.googleAds.appOpenAdMobIOS);
  static String bannerAdMobIOS = TypeSafeConversion.nullSafeString(EnvironmentVariable.googleAds.bannerAdMobIOS);
  static String interstitielAdMobIOS = TypeSafeConversion.nullSafeString(EnvironmentVariable.googleAds.interstitielAdMobIOS);
  static String rewardedAdMobIOS = TypeSafeConversion.nullSafeString(EnvironmentVariable.googleAds.rewardedAdMobIOS);
  static String rewardedInterstitielAdMobIOS = TypeSafeConversion.nullSafeString(EnvironmentVariable.googleAds.rewardedInterstitielAdMobIOS);
  static String natifAdvancedAdMobIOS = TypeSafeConversion.nullSafeString(EnvironmentVariable.googleAds.natifAdvancedAdMobIOS);
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