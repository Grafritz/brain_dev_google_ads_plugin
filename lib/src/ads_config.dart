/// Application pour laquelle les identifiants AdMob sont choisis (en publication). Mêmes valeurs que l'ancien
/// `EnumEnvironmentType` de `brain_dev_tools`, pour que le branchement se fasse par le nom.
enum AdsEnvironment {
  chantchoraleetgroupe,
  chantdesperance,
  chantdesperancelegacy,
  lyricevangelique,
  chantlyric,
  labible,
  legoutduchef,
  planifMax,
  custom,
}

/// Identifiants AdMob fournis par l'application (environnement [AdsEnvironment.custom]).
class AdsCustomUnits {
  const AdsCustomUnits({
    this.appIdAdMobAndroid,
    this.appOpenAdMobAndroid,
    this.bannerAdMobAndroid,
    this.interstitielAdMobAndroid,
    this.rewardedAdMobAndroid,
    this.rewardedInterstitielAdMobAndroid,
    this.natifAdvancedAdMobAndroid,
    this.appIdAdMobIOS,
    this.appOpenAdMobIOS,
    this.bannerAdMobIOS,
    this.interstitielAdMobIOS,
    this.rewardedAdMobIOS,
    this.rewardedInterstitielAdMobIOS,
    this.natifAdvancedAdMobIOS,
  });

  final String? appIdAdMobAndroid;
  final String? appOpenAdMobAndroid;
  final String? bannerAdMobAndroid;
  final String? interstitielAdMobAndroid;
  final String? rewardedAdMobAndroid;
  final String? rewardedInterstitielAdMobAndroid;
  final String? natifAdvancedAdMobAndroid;

  final String? appIdAdMobIOS;
  final String? appOpenAdMobIOS;
  final String? bannerAdMobIOS;
  final String? interstitielAdMobIOS;
  final String? rewardedAdMobIOS;
  final String? rewardedInterstitielAdMobIOS;
  final String? natifAdvancedAdMobIOS;
}

/// Ce que le plugin demande à l'application : quelle application c'est, et ses réglages publicitaires. Le plugin ne
/// lit plus la configuration de `brain_dev_tools`.
class AdsConfig {
  const AdsConfig({
    this.environment = AdsEnvironment.custom,
    this.isShowBrainBanner = true,
    this.customUnits = const AdsCustomUnits(),
  });

  final AdsEnvironment environment;

  /// Affiche les bannières croisées des applications BrainDev.
  final bool isShowBrainBanner;

  final AdsCustomUnits customUnits;
}

/// Configuration courante, posée par `initBrainDevGoogleAds(config: …)`. Sans initialisation : environnement `custom`
/// sans identifiant (aucune publicité chargée, jamais celles d'une autre application).
class BrainDevAdsConfig {
  BrainDevAdsConfig._();

  static AdsConfig current = const AdsConfig();
}
