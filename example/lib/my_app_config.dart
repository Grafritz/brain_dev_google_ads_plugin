// ignore_for_file: constant_identifier_names

import 'package:brain_dev_tools/I10n/l10n.dart';
import 'package:brain_dev_tools/config/app_config.dart';
import 'package:brain_dev_tools/tools/enum/enum.dart';

class MyAppConfig {
  static String urlDevMiddlewareServer = "http://localhost:1993/";
  static String urlQAMiddlewareServer = "https://middleware.qa.lyricstream.app/";
  static String urlProductionMiddlewareServer = "https://middleware.lyricstream.app/";

  static const String appName = "Dictionnaire Medical";
  static const String assetsPathLanguage = '';

  static const String assetsPathLanguageToMerge = '';
  //static var firebaseOptions = DefaultFirebaseOptions.currentPlatform;
  static EnumEnvironmentType enumEnvironmentType= EnumEnvironmentType.chantchoraleetgroupe;
  static EnumTemplateLogin templateLogin = EnumTemplateLogin.template1;
  static var appLanguages = L10n.languages_en_fr_es_ht;
  static bool isConnectionRequired = true;
  static bool isBibleActive = true;

  static void setDevData() {
    SetUpEnvironment.dev(appConfig: AppConfig(
      appName: appName,
      urlMiddlewareServer: urlDevMiddlewareServer,
      appImage: ImageModel(
          logoCircleLight: '',
          logoSquareLight: '',
          logoSquareDark: '',
          bgImageLight: '',
          bgImageDark: ''
      ),
      enumEnvironmentType: enumEnvironmentType,
      isConnectionRequired: isConnectionRequired,
      isBibleActive: isBibleActive,
      templateLogin: templateLogin,
      googleAds: GoogleAdsModel(),
      appLanguages: appLanguages,
      assetsPathLanguage: assetsPathLanguage,
      assetsPathLanguageToMerge: assetsPathLanguageToMerge,
      //firebaseOptions: firebaseOptions,
    ));
  }

  static void setQAData() {
    SetUpEnvironment.qa(appConfig: AppConfig(
      appName: appName,
      urlMiddlewareServer: urlQAMiddlewareServer,
      appImage: ImageModel(
          logoCircleLight: '',
          logoSquareLight: '',
          logoSquareDark: '',
          bgImageLight: '',
          bgImageDark: ''
      ),
      enumEnvironmentType: enumEnvironmentType,
      isConnectionRequired: isConnectionRequired,
      isBibleActive: isBibleActive,
      templateLogin: templateLogin,
      googleAds: GoogleAdsModel(),
      appLanguages: appLanguages,
      assetsPathLanguage: assetsPathLanguage,
      assetsPathLanguageToMerge: assetsPathLanguageToMerge,
      //firebaseOptions: firebaseOptions,
    ));
  }

  static void setProdData() {
    SetUpEnvironment.prod(appConfig: AppConfig(
      appName: appName,
      urlMiddlewareServer: urlProductionMiddlewareServer,
      appImage: ImageModel(
          logoCircleLight: '',
          logoSquareLight: '',
          logoSquareDark: '',
          bgImageLight: '',
          bgImageDark: ''
      ),
      enumEnvironmentType: enumEnvironmentType,
      isConnectionRequired: isConnectionRequired,
      isBibleActive: isBibleActive,
      templateLogin: templateLogin,
      googleAds: GoogleAdsModel(),
      appLanguages: appLanguages,
      assetsPathLanguage: assetsPathLanguage,
      assetsPathLanguageToMerge: assetsPathLanguageToMerge,
      //firebaseOptions: firebaseOptions,
    ));
  }
}