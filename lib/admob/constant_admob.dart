import 'dart:io';

import 'package:brain_dev_google_ads/admob/constant_admob_chant_chorale_et_groupe.dart';
import 'package:brain_dev_google_ads/admob/constant_admob_chant_desperance.dart';
import 'package:brain_dev_google_ads/admob/constant_admob_chant_desperance_legacy.dart';
import 'package:brain_dev_google_ads/admob/constant_admob_chant_lyric.dart';
import 'package:brain_dev_google_ads/admob/constant_admob_custom.dart';
import 'package:brain_dev_google_ads/admob/constant_admob_la_bible.dart';
import 'package:brain_dev_google_ads/admob/constant_admob_le_gout_du_chef.dart';
import 'package:brain_dev_google_ads/admob/constant_admob_planif_max.dart';
import 'package:brain_dev_google_ads/admob/constant_admob_lyric_evangelique.dart';
import 'package:brain_dev_google_ads/src/ads_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Placeholder text.
const String placeholderText = 'Lorem ipsum dolor sit amet, consectetur , sed do Lorem ipsum';
const int maxFailedLoadAttempts = 3;
const AdRequest request = AdRequest(
  keywords: <String>['foo', 'bar'],
  contentUrl: 'http://foo.com/bar.html',
  nonPersonalizedAds: true,
);

//region [ AdMob Android et iOS ]

//region [ AdMob Android - TEST ]
String appIdAdMobAndroidTEST = "ca-app-pub-3940256099942544~3347511713";
String appOpenAdMobAndroidTEST = "ca-app-pub-3940256099942544/9257395921";
String bannerAdMobAndroidTEST = "ca-app-pub-3940256099942544/6300978111";
String interstitielAdMobAndroidTEST = "ca-app-pub-3940256099942544/1033173712";
String rewardedAdMobAndroidTEST = "ca-app-pub-3940256099942544/5224354917";
String rewardedInterstitielAdMobAndroidTEST = "ca-app-pub-3940256099942544/5354046379";
String natifAdvancedAdMobAndroidTEST = "ca-app-pub-3940256099942544/2247696110";
//endregion

//region [ AdMob iOS - TEST ]
String appIdAdMobIOsTEST = "ca-app-pub-3940256099942544~1458002511";
String appOpenAdMobIOsTEST = "ca-app-pub-3940256099942544/5662855259";
String bannerAdMobIOsTEST = "ca-app-pub-3940256099942544/2934735716";
String interstitielAdMobIOsTEST = "ca-app-pub-3940256099942544/4411468910";
String rewardedAdMobIOsTEST = "ca-app-pub-3940256099942544/1712485313";
String rewardedInterstitielAdMobIOsTEST = "ca-app-pub-3940256099942544/6978759866";
String natifAdvancedAdMobIOsTEST = "ca-app-pub-3940256099942544/3986624511";
//endregion

//region [ AdMob For Get Id For Android or iOS / in Test Or Not ]

final String appOpenAdTestAdUnitId =
    Platform.isAndroid ? appOpenAdMobAndroidTEST : appOpenAdMobIOsTEST;

final String testAppId =
    Platform.isAndroid ? appIdAdMobAndroidTEST : appIdAdMobIOsTEST;

final String bannerTestAdUnitId =
    Platform.isAndroid ? bannerAdMobAndroidTEST : bannerAdMobIOsTEST;

final String interstitialAdTestAdUnitId = Platform.isAndroid
    ? interstitielAdMobAndroidTEST
    : interstitielAdMobIOsTEST;

final String rewardedInterstitialAdTestAdUnitId = Platform.isAndroid
    ? rewardedInterstitielAdMobAndroidTEST
    : rewardedInterstitielAdMobIOsTEST;

final String rewardedVideoAdTestAdUnitId =
    Platform.isAndroid ? rewardedAdMobAndroidTEST : rewardedAdMobIOsTEST;

final String nativeAdTestAdUnitId = Platform.isAndroid
    ? natifAdvancedAdMobAndroidTEST
    : natifAdvancedAdMobIOsTEST;

String getAppIdAdMob() {
  if (!kReleaseMode) {
    return testAppId;
  }
  AdsEnvironment env = BrainDevAdsConfig.current.environment;
  switch (env) {
    case AdsEnvironment.chantchoraleetgroupe:
      return AdmobChantChoraleEtGroupe.appIdAdMob;

    case AdsEnvironment.chantdesperance:
      return AdmobChantDesperance.appIdAdMob;

    case AdsEnvironment.chantdesperancelegacy:
      return AdmobChantDesperanceLegacy.appIdAdMob;

    case AdsEnvironment.lyricevangelique:
      return AdmobLyricEvangelique.appIdAdMob;

    case AdsEnvironment.chantlyric:
      return AdmobChantLyric.appIdAdMob;

    case AdsEnvironment.labible:
      return AdmobLaBible.appIdAdMob;

    case AdsEnvironment.legoutduchef:
      return AdmobLeGoutDuChef.appIdAdMob;

    case AdsEnvironment.planifMax:
      return AdmobPlanifMax.appIdAdMob;

    case AdsEnvironment.custom:
      return AdmobPlanifMax.appIdAdMob;

    // default:
    //   return AdmobChantChoraleEtGroupe.appIdAdMob;
  }
  //return AdmobChantChoraleEtGroupe.appIdAdMob;
}

String getAppOpenAdUnitId() {
  if (!kReleaseMode) {
    return appOpenAdTestAdUnitId;
  }
  AdsEnvironment env = BrainDevAdsConfig.current.environment;
  switch (env) {
    case AdsEnvironment.chantchoraleetgroupe:
      return AdmobChantChoraleEtGroupe.appOpenAdUnitId;

    case AdsEnvironment.chantdesperance:
      return AdmobChantDesperance.appOpenAdUnitId;

    case AdsEnvironment.chantdesperancelegacy:
      return AdmobChantDesperanceLegacy.appOpenAdUnitId;

    case AdsEnvironment.lyricevangelique:
      return AdmobLyricEvangelique.appOpenAdUnitId;

    case AdsEnvironment.chantlyric:
      return AdmobChantLyric.appOpenAdUnitId;

    case AdsEnvironment.labible:
      return AdmobLaBible.appOpenAdUnitId;

    case AdsEnvironment.legoutduchef:
      return AdmobLeGoutDuChef.appOpenAdUnitId;

    case AdsEnvironment.planifMax:
      return AdmobPlanifMax.appOpenAdUnitId;

    case AdsEnvironment.custom:
      return AdmobCustom.appOpenAdUnitId;

    // default:
    //   return AdmobChantChoraleEtGroupe.appOpenAdUnitId;
  }
  //return AdmobChantChoraleEtGroupe.appOpenAdUnitId;
}


String getBannerAdUnitId() {
  if (!kReleaseMode) {
    return bannerTestAdUnitId;
  }
  AdsEnvironment env = BrainDevAdsConfig.current.environment;
  switch (env) {
    case AdsEnvironment.chantchoraleetgroupe:
      return AdmobChantChoraleEtGroupe.bannerAdUnitId;

    case AdsEnvironment.chantdesperance:
      return AdmobChantDesperance.bannerAdUnitId;

    case AdsEnvironment.chantdesperancelegacy:
      return AdmobChantDesperanceLegacy.bannerAdUnitId;

    case AdsEnvironment.lyricevangelique:
      return AdmobLyricEvangelique.bannerAdUnitId;

    case AdsEnvironment.chantlyric:
      return AdmobChantLyric.bannerAdUnitId;

    case AdsEnvironment.labible:
      return AdmobLaBible.bannerAdUnitId;

    case AdsEnvironment.legoutduchef:
      return AdmobLeGoutDuChef.bannerAdUnitId;

    case AdsEnvironment.planifMax:
      return AdmobPlanifMax.bannerAdUnitId;

    case AdsEnvironment.custom:
      return AdmobCustom.bannerAdUnitId;

    // default:
    //   return AdmobChantChoraleEtGroupe.bannerAdUnitId;
  }
  //return AdmobChantChoraleEtGroupe.bannerAdUnitId;
}

String getInterstitielAdUnitId() {
  if (!kReleaseMode) {
    return interstitialAdTestAdUnitId;
  }
  AdsEnvironment env = BrainDevAdsConfig.current.environment;
  switch (env) {
    case AdsEnvironment.chantchoraleetgroupe:
      return AdmobChantChoraleEtGroupe.interstitielAdUnitId;

    case AdsEnvironment.chantdesperance:
      return AdmobChantDesperance.interstitielAdUnitId;

    case AdsEnvironment.chantdesperancelegacy:
      return AdmobChantDesperanceLegacy.interstitielAdUnitId;

    case AdsEnvironment.lyricevangelique:
      return AdmobLyricEvangelique.interstitielAdUnitId;

    case AdsEnvironment.chantlyric:
      return AdmobChantLyric.interstitielAdUnitId;

    case AdsEnvironment.labible:
      return AdmobLaBible.interstitielAdUnitId;

    case AdsEnvironment.legoutduchef:
      return AdmobLeGoutDuChef.interstitielAdUnitId;

    case AdsEnvironment.planifMax:
      return AdmobPlanifMax.interstitielAdUnitId;

    case AdsEnvironment.custom:
      return AdmobCustom.interstitielAdUnitId;

    // default:
    //   return AdmobChantChoraleEtGroupe.interstitielAdUnitId;
  }
  //return AdmobChantChoraleEtGroupe.interstitielAdUnitId;
}

String getRewardedInterstitialAdUnitId() {
  if (!kReleaseMode) {
    return rewardedInterstitialAdTestAdUnitId;
  }
  AdsEnvironment env = BrainDevAdsConfig.current.environment;
  switch (env) {
    case AdsEnvironment.chantchoraleetgroupe:
      return AdmobChantChoraleEtGroupe.rewardedInterstitialAdUnitId;

    case AdsEnvironment.chantdesperance:
      return AdmobChantDesperance.rewardedInterstitialAdUnitId;

    case AdsEnvironment.chantdesperancelegacy:
      return AdmobChantDesperanceLegacy.rewardedInterstitialAdUnitId;

    case AdsEnvironment.lyricevangelique:
      return AdmobLyricEvangelique.rewardedInterstitialAdUnitId;

    case AdsEnvironment.chantlyric:
      return AdmobChantLyric.rewardedInterstitialAdUnitId;

    case AdsEnvironment.labible:
      return AdmobLaBible.rewardedInterstitialAdUnitId;

    case AdsEnvironment.legoutduchef:
      return AdmobLeGoutDuChef.rewardedInterstitialAdUnitId;

    case AdsEnvironment.planifMax:
      return AdmobPlanifMax.rewardedInterstitialAdUnitId;

    case AdsEnvironment.custom:
      return AdmobCustom.rewardedInterstitialAdUnitId;

    // default:
    //   return AdmobChantChoraleEtGroupe.rewardedInterstitialAdUnitId;
  }
  //return AdmobChantChoraleEtGroupe.rewardedInterstitialAdUnitId;
}

String getRewardedVideoAdUnitId() {
  if (!kReleaseMode) {
    return rewardedVideoAdTestAdUnitId;
  }
  AdsEnvironment env = BrainDevAdsConfig.current.environment;
  switch (env) {
    case AdsEnvironment.chantchoraleetgroupe:
      return AdmobChantChoraleEtGroupe.rewardedVideoAdUnitId;

    case AdsEnvironment.chantdesperance:
      return AdmobChantDesperance.rewardedVideoAdUnitId;

    case AdsEnvironment.chantdesperancelegacy:
      return AdmobChantDesperanceLegacy.rewardedVideoAdUnitId;

    case AdsEnvironment.lyricevangelique:
      return AdmobLyricEvangelique.rewardedVideoAdUnitId;

    case AdsEnvironment.chantlyric:
      return AdmobChantLyric.rewardedVideoAdUnitId;

    case AdsEnvironment.labible:
      return AdmobLaBible.rewardedVideoAdUnitId;

    case AdsEnvironment.legoutduchef:
      return AdmobLeGoutDuChef.rewardedVideoAdUnitId;

    case AdsEnvironment.planifMax:
      return AdmobPlanifMax.rewardedVideoAdUnitId;

    case AdsEnvironment.custom:
      return AdmobCustom.rewardedVideoAdUnitId;

    // default:
    //   return AdmobChantChoraleEtGroupe.rewardedVideoAdUnitId;
  }
  //return AdmobChantChoraleEtGroupe.rewardedVideoAdUnitId;
}

String getNatifAdvancedAdUnitId() {
  if (!kReleaseMode) {
    return nativeAdTestAdUnitId;
  }
  AdsEnvironment env = BrainDevAdsConfig.current.environment;
  switch (env) {
    case AdsEnvironment.chantchoraleetgroupe:
      return AdmobChantChoraleEtGroupe.natifAdvancedAdUnitId;

    case AdsEnvironment.chantdesperance:
      return AdmobChantDesperance.natifAdvancedAdUnitId;

    case AdsEnvironment.chantdesperancelegacy:
      return AdmobChantDesperanceLegacy.natifAdvancedAdUnitId;

    case AdsEnvironment.lyricevangelique:
      return AdmobLyricEvangelique.natifAdvancedAdUnitId;

    case AdsEnvironment.chantlyric:
      return AdmobChantLyric.natifAdvancedAdUnitId;

    case AdsEnvironment.labible:
      return AdmobLaBible.natifAdvancedAdUnitId;

    case AdsEnvironment.legoutduchef:
      return AdmobLeGoutDuChef.natifAdvancedAdUnitId;

    case AdsEnvironment.planifMax:
      return AdmobPlanifMax.natifAdvancedAdUnitId;

    case AdsEnvironment.custom:
      return AdmobCustom.natifAdvancedAdUnitId;

    // default:
    //   return AdmobChantChoraleEtGroupe.natifAdvancedAdUnitId;
  }
  //return AdmobChantChoraleEtGroupe.natifAdvancedAdUnitId;
}
//endregion

/// The initial size of the banner is calculated on the height of the
/// viewport. Due to ADMob banner refresh policies, in order to have
/// a consistent behaviour, we should keep track of the current AD size
/// and maintain it when the user rotates the screen, and update that
/// value at every banner successful.
/// For now, we will avoid this complexity and set the banner height to
/// the maximum height that a banner could get on this device, forcing
/// the use of the longest side as the base.
/// see https://developers.google.com/admob/android/banner#smart_banners
double getSmartBannerHeight(BuildContext context) {
  MediaQueryData mediaScreen = MediaQuery.of(context);
  double dpHeight = mediaScreen.orientation == Orientation.portrait
      ? mediaScreen.size.height
      : mediaScreen.size.width;
  double dim= 50.0;
  if (dpHeight <= 400.0) {
    dim= 32.0;
  }
  if (dpHeight >= 720.0) {
    dim= 90.0;
  }
  // Tools.logCat("Device height: $dpHeight | Ads Height:$dim");
  return dim;
}
//endregion