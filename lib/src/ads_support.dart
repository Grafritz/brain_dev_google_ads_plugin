import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

/// Plateforme courante (remplace `CheckPlatform` de `brain_dev_tools`).
class AdsPlatform {
  AdsPlatform._();

  static bool get isMobile => defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android;

  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
}

/// Conversions sûres (remplace `TypeSafeConversion` de `brain_dev_tools`, mêmes résultats).
class AdsConversions {
  AdsConversions._();

  static final RegExp _numeric = RegExp(r'^-?[0-9]+$');

  static String nullSafeString(Object? arg, {String defaultValue = ''}) {
    if (arg == null || arg.toString().isEmpty) return defaultValue;
    return '$arg';
  }

  static int nullSafeInt(Object? arg, {int defaultInt = 0}) {
    if (arg == null || arg.toString().isEmpty) return defaultInt;
    final text = arg.toString();
    return _numeric.hasMatch(text) ? int.parse(text) : defaultInt;
  }

  static bool nullSafeBool(Object? arg) {
    if (arg == null || arg.toString().isEmpty) return false;
    final text = arg.toString().toLowerCase();
    return text == '1' || text == 'true';
  }
}

/// Sites des applications BrainDev affichés dans les bannières croisées, et ouverture dans le navigateur.
class AdsLinks {
  AdsLinks._();

  static const String urlWebSiteRezo509 = 'https://www.rezo509.com/';
  static const String urlWebSiteLaBible = 'https://labible.rezo509.com/';
  static const String urlWebSiteBrainDev = 'https://www.brain-dev.net';
  static const String urlWebSiteChantCCG = 'https://www.chant.rezo509.com/mobile/Frm_GroupeLivreChant.aspx';

  /// Date au format `yyyyMMdd` (remplace `DateFormat('yyyyMMdd')`).
  static String formatYyyyMMdd(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';

  static Future<void> launchInBrowser(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}

/// Style du texte « récompense » (remplace `ToolsWidget().styleReward`).
TextStyle adsRewardStyle({double fontSize = 12}) => TextStyle(
      color: adsColorForLightTheme(isDark: Get.isDarkMode, color: Theme.of(Get.context!).primaryColorDark),
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
    );

/// [color] en thème clair, `null` (couleur par défaut) en thème sombre (remplace `ToolsWidget().getColor`).
Color? adsColorForLightTheme({required bool isDark, Color color = Colors.white}) => isDark ? null : color;

/// Bouton plein sur fond [backgroundColor], texte blanc (remplace `elevatedButtonNormal`).
ButtonStyle adsButtonStyle({required Color backgroundColor}) =>
    ElevatedButton.styleFrom(backgroundColor: backgroundColor, foregroundColor: Colors.white);
