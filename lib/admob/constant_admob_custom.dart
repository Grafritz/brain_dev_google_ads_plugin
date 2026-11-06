import 'dart:io';

import 'package:brain_dev_google_ads/src/ads_config.dart';
import 'package:brain_dev_google_ads/src/ads_support.dart';

class AdmobCustom
{
  AdsCustomUnits get googleAds => BrainDevAdsConfig.current.customUnits;
//region [ AdMob Android et iOS ]
//region [ AdMob Android ]
  static String appIdAdMobAndroid = AdsConversions.nullSafeString(BrainDevAdsConfig.current.customUnits.appIdAdMobAndroid);
  static String appOpenAdMobAndroid = AdsConversions.nullSafeString(BrainDevAdsConfig.current.customUnits.appOpenAdMobAndroid);
  static String bannerAdMobAndroid = AdsConversions.nullSafeString(BrainDevAdsConfig.current.customUnits.bannerAdMobAndroid);
  static String interstitielAdMobAndroid = AdsConversions.nullSafeString(BrainDevAdsConfig.current.customUnits.interstitielAdMobAndroid);
  static String rewardedAdMobAndroid = AdsConversions.nullSafeString(BrainDevAdsConfig.current.customUnits.rewardedAdMobAndroid);
  static String rewardedInterstitielAdMobAndroid = AdsConversions.nullSafeString(BrainDevAdsConfig.current.customUnits.rewardedInterstitielAdMobAndroid);
  static String natifAdvancedAdMobAndroid = AdsConversions.nullSafeString(BrainDevAdsConfig.current.customUnits.natifAdvancedAdMobAndroid);
//endregion

//region [ AdMob iOS ]
  static String appIdAdMobIOS = AdsConversions.nullSafeString(BrainDevAdsConfig.current.customUnits.appIdAdMobIOS);
  static String appOpenAdMobIOS = AdsConversions.nullSafeString(BrainDevAdsConfig.current.customUnits.appOpenAdMobIOS);
  static String bannerAdMobIOS = AdsConversions.nullSafeString(BrainDevAdsConfig.current.customUnits.bannerAdMobIOS);
  static String interstitielAdMobIOS = AdsConversions.nullSafeString(BrainDevAdsConfig.current.customUnits.interstitielAdMobIOS);
  static String rewardedAdMobIOS = AdsConversions.nullSafeString(BrainDevAdsConfig.current.customUnits.rewardedAdMobIOS);
  static String rewardedInterstitielAdMobIOS = AdsConversions.nullSafeString(BrainDevAdsConfig.current.customUnits.rewardedInterstitielAdMobIOS);
  static String natifAdvancedAdMobIOS = AdsConversions.nullSafeString(BrainDevAdsConfig.current.customUnits.natifAdvancedAdMobIOS);
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