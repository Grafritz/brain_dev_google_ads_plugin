import 'package:brain_dev_google_ads/brain_dev_google_ads.dart';
import 'package:brain_dev_google_ads/src/ads_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdsConversions (mêmes résultats que TypeSafeConversion)', () {
    test('nullSafeString', () {
      expect(AdsConversions.nullSafeString(null), '');
      expect(AdsConversions.nullSafeString(''), '');
      expect(AdsConversions.nullSafeString('x'), 'x');
      expect(AdsConversions.nullSafeString(12), '12');
      expect(AdsConversions.nullSafeString(null, defaultValue: 'd'), 'd');
    });

    test('nullSafeInt', () {
      expect(AdsConversions.nullSafeInt(null), 0);
      expect(AdsConversions.nullSafeInt('20261103'), 20261103);
      expect(AdsConversions.nullSafeInt('abc', defaultInt: 7), 7);
      expect(AdsConversions.nullSafeInt(''), 0);
    });

    test('nullSafeBool', () {
      expect(AdsConversions.nullSafeBool(null), isFalse);
      expect(AdsConversions.nullSafeBool('true'), isTrue);
      expect(AdsConversions.nullSafeBool('TRUE'), isTrue);
      expect(AdsConversions.nullSafeBool(1), isTrue);
      expect(AdsConversions.nullSafeBool('0'), isFalse);
      expect(AdsConversions.nullSafeBool(''), isFalse);
    });
  });

  group('AdsLinks', () {
    test('formatYyyyMMdd', () {
      expect(AdsLinks.formatYyyyMMdd(DateTime(2026, 11, 3)), '20261103');
      expect(AdsLinks.formatYyyyMMdd(DateTime(2026, 1, 9)), '20260109');
    });

    test('la date au format yyyyMMdd se compare comme un nombre (expiration des bannières)', () {
      final before = AdsConversions.nullSafeInt(AdsLinks.formatYyyyMMdd(DateTime(2026, 12, 31)));
      final after = AdsConversions.nullSafeInt(AdsLinks.formatYyyyMMdd(DateTime(2027, 1, 1)));

      expect(after, greaterThan(before));
    });
  });

  test('adsColorForLightTheme : la couleur en thème clair, la couleur par défaut (null) en thème sombre', () {
    expect(adsColorForLightTheme(isDark: false, color: Colors.red), Colors.red);
    expect(adsColorForLightTheme(isDark: true, color: Colors.red), isNull);
    expect(adsColorForLightTheme(isDark: false), Colors.white);
  });

  test('adsButtonStyle : fond demandé, texte blanc', () {
    final style = adsButtonStyle(backgroundColor: Colors.teal);

    expect(style.backgroundColor?.resolve({}), Colors.teal);
    expect(style.foregroundColor?.resolve({}), Colors.white);
  });

  group('AdsConfig', () {
    test('sans initialisation : environnement custom sans identifiant (jamais ceux d\'une autre application)', () {
      BrainDevAdsConfig.current = const AdsConfig();

      expect(BrainDevAdsConfig.current.environment, AdsEnvironment.custom);
      expect(BrainDevAdsConfig.current.customUnits.bannerAdMobAndroid, isNull);
      expect(BrainDevAdsConfig.current.isShowBrainBanner, isTrue);
    });
  });
}
