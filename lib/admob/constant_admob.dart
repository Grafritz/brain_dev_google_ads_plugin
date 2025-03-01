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
import 'package:brain_dev_tools/config/app_config.dart';
import 'package:brain_dev_tools/tools/enum/enum.dart';
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
  EnumEnvironmentType env = EnvironmentVariable.environmentType;
  switch (env) {
    case EnumEnvironmentType.chantchoraleetgroupe:
      return AdmobChantChoraleEtGroupe.appIdAdMob;

    case EnumEnvironmentType.chantdesperance:
      return AdmobChantDesperance.appIdAdMob;

    case EnumEnvironmentType.chantdesperancelegacy:
      return AdmobChantDesperanceLegacy.appIdAdMob;

    case EnumEnvironmentType.lyricevangelique:
      return AdmobLyricEvangelique.appIdAdMob;

    case EnumEnvironmentType.chantlyric:
      return AdmobChantLyric.appIdAdMob;

    case EnumEnvironmentType.labible:
      return AdmobLaBible.appIdAdMob;

    case EnumEnvironmentType.legoutduchef:
      return AdmobLeGoutDuChef.appIdAdMob;

    case EnumEnvironmentType.planifMax:
      return AdmobPlanifMax.appIdAdMob;

    case EnumEnvironmentType.custom:
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
  EnumEnvironmentType env = EnvironmentVariable.environmentType;
  switch (env) {
    case EnumEnvironmentType.chantchoraleetgroupe:
      return AdmobChantChoraleEtGroupe.appOpenAdUnitId;

    case EnumEnvironmentType.chantdesperance:
      return AdmobChantDesperance.appOpenAdUnitId;

    case EnumEnvironmentType.chantdesperancelegacy:
      return AdmobChantDesperanceLegacy.appOpenAdUnitId;

    case EnumEnvironmentType.lyricevangelique:
      return AdmobLyricEvangelique.appOpenAdUnitId;

    case EnumEnvironmentType.chantlyric:
      return AdmobChantLyric.appOpenAdUnitId;

    case EnumEnvironmentType.labible:
      return AdmobLaBible.appOpenAdUnitId;

    case EnumEnvironmentType.legoutduchef:
      return AdmobLeGoutDuChef.appOpenAdUnitId;

    case EnumEnvironmentType.planifMax:
      return AdmobPlanifMax.appOpenAdUnitId;

    case EnumEnvironmentType.custom:
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
  EnumEnvironmentType env = EnvironmentVariable.environmentType;
  switch (env) {
    case EnumEnvironmentType.chantchoraleetgroupe:
      return AdmobChantChoraleEtGroupe.bannerAdUnitId;

    case EnumEnvironmentType.chantdesperance:
      return AdmobChantDesperance.bannerAdUnitId;

    case EnumEnvironmentType.chantdesperancelegacy:
      return AdmobChantDesperanceLegacy.bannerAdUnitId;

    case EnumEnvironmentType.lyricevangelique:
      return AdmobLyricEvangelique.bannerAdUnitId;

    case EnumEnvironmentType.chantlyric:
      return AdmobChantLyric.bannerAdUnitId;

    case EnumEnvironmentType.labible:
      return AdmobLaBible.bannerAdUnitId;

    case EnumEnvironmentType.legoutduchef:
      return AdmobLeGoutDuChef.bannerAdUnitId;

    case EnumEnvironmentType.planifMax:
      return AdmobPlanifMax.bannerAdUnitId;

    case EnumEnvironmentType.custom:
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
  EnumEnvironmentType env = EnvironmentVariable.environmentType;
  switch (env) {
    case EnumEnvironmentType.chantchoraleetgroupe:
      return AdmobChantChoraleEtGroupe.interstitielAdUnitId;

    case EnumEnvironmentType.chantdesperance:
      return AdmobChantDesperance.interstitielAdUnitId;

    case EnumEnvironmentType.chantdesperancelegacy:
      return AdmobChantDesperanceLegacy.interstitielAdUnitId;

    case EnumEnvironmentType.lyricevangelique:
      return AdmobLyricEvangelique.interstitielAdUnitId;

    case EnumEnvironmentType.chantlyric:
      return AdmobChantLyric.interstitielAdUnitId;

    case EnumEnvironmentType.labible:
      return AdmobLaBible.interstitielAdUnitId;

    case EnumEnvironmentType.legoutduchef:
      return AdmobLeGoutDuChef.interstitielAdUnitId;

    case EnumEnvironmentType.planifMax:
      return AdmobPlanifMax.interstitielAdUnitId;

    case EnumEnvironmentType.custom:
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
  EnumEnvironmentType env = EnvironmentVariable.environmentType;
  switch (env) {
    case EnumEnvironmentType.chantchoraleetgroupe:
      return AdmobChantChoraleEtGroupe.rewardedInterstitialAdUnitId;

    case EnumEnvironmentType.chantdesperance:
      return AdmobChantDesperance.rewardedInterstitialAdUnitId;

    case EnumEnvironmentType.chantdesperancelegacy:
      return AdmobChantDesperanceLegacy.rewardedInterstitialAdUnitId;

    case EnumEnvironmentType.lyricevangelique:
      return AdmobLyricEvangelique.rewardedInterstitialAdUnitId;

    case EnumEnvironmentType.chantlyric:
      return AdmobChantLyric.rewardedInterstitialAdUnitId;

    case EnumEnvironmentType.labible:
      return AdmobLaBible.rewardedInterstitialAdUnitId;

    case EnumEnvironmentType.legoutduchef:
      return AdmobLeGoutDuChef.rewardedInterstitialAdUnitId;

    case EnumEnvironmentType.planifMax:
      return AdmobPlanifMax.rewardedInterstitialAdUnitId;

    case EnumEnvironmentType.custom:
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
  EnumEnvironmentType env = EnvironmentVariable.environmentType;
  switch (env) {
    case EnumEnvironmentType.chantchoraleetgroupe:
      return AdmobChantChoraleEtGroupe.rewardedVideoAdUnitId;

    case EnumEnvironmentType.chantdesperance:
      return AdmobChantDesperance.rewardedVideoAdUnitId;

    case EnumEnvironmentType.chantdesperancelegacy:
      return AdmobChantDesperanceLegacy.rewardedVideoAdUnitId;

    case EnumEnvironmentType.lyricevangelique:
      return AdmobLyricEvangelique.rewardedVideoAdUnitId;

    case EnumEnvironmentType.chantlyric:
      return AdmobChantLyric.rewardedVideoAdUnitId;

    case EnumEnvironmentType.labible:
      return AdmobLaBible.rewardedVideoAdUnitId;

    case EnumEnvironmentType.legoutduchef:
      return AdmobLeGoutDuChef.rewardedVideoAdUnitId;

    case EnumEnvironmentType.planifMax:
      return AdmobPlanifMax.rewardedVideoAdUnitId;

    case EnumEnvironmentType.custom:
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
  EnumEnvironmentType env = EnvironmentVariable.environmentType;
  switch (env) {
    case EnumEnvironmentType.chantchoraleetgroupe:
      return AdmobChantChoraleEtGroupe.natifAdvancedAdUnitId;

    case EnumEnvironmentType.chantdesperance:
      return AdmobChantDesperance.natifAdvancedAdUnitId;

    case EnumEnvironmentType.chantdesperancelegacy:
      return AdmobChantDesperanceLegacy.natifAdvancedAdUnitId;

    case EnumEnvironmentType.lyricevangelique:
      return AdmobLyricEvangelique.natifAdvancedAdUnitId;

    case EnumEnvironmentType.chantlyric:
      return AdmobChantLyric.natifAdvancedAdUnitId;

    case EnumEnvironmentType.labible:
      return AdmobLaBible.natifAdvancedAdUnitId;

    case EnumEnvironmentType.legoutduchef:
      return AdmobLeGoutDuChef.natifAdvancedAdUnitId;

    case EnumEnvironmentType.planifMax:
      return AdmobPlanifMax.natifAdvancedAdUnitId;

    case EnumEnvironmentType.custom:
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