import 'dart:async';

import 'package:brain_dev_google_ads/admob/constant_admob.dart';
import 'package:brain_dev_tools/tools/check_platform.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAdWidget extends StatefulWidget {
  const NativeAdWidget({super.key});

  @override
  State<NativeAdWidget> createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {
  NativeAd? _nativeAd;
  bool isAdLoaded = false;
  final Completer<NativeAd> nativeAdCompleter = Completer<NativeAd>();

  @override
  void initState() {
    super.initState();
    _loadNativeAd();
  }

  void _loadNativeAd() {
    _nativeAd = NativeAd(
      adUnitId: getNatifAdvancedAdUnitId(),
      factoryId: 'listTile',
      request: const AdRequest(nonPersonalizedAds: false),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          debugPrint('NativeAd failed to load: $error');
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    try {
      if (checkPlatform.isMobile) {
        // Create the ad objects and load ads.
        _nativeAd = NativeAd(
            adUnitId: getBannerAdUnitId(),
            request: const AdRequest(),
            listener: NativeAdListener(
              onAdLoaded: (Ad ad) {
                nativeAdCompleter.complete(ad as NativeAd);
              },
              onAdFailedToLoad: (Ad ad, LoadAdError error) {
                //logCat('$BannerAd failedToLoad: $error');
                nativeAdCompleter.completeError(error);
                ad.dispose();
              },
              //onAdWillDismissScreen: (Ad ad) =>Tools.logCat('$BannerAd onAdWillDismissScreen.'),
              //onAdOpened: (Ad ad) => Tools.logCat('$BannerAd onAdOpened.'),
              //onAdClosed: (Ad ad) => Tools.logCat('$BannerAd onAdClosed.'),
              //onAdImpression: (Ad ad) => Tools.logCat('$BannerAd onAdImpression. [ ${ad.adUnitId} ]'),
            ))
          ..load();
      }
    }catch(ex, trace){
      logError(ex, trace: trace, position: 'didChangeDependencies');
    }
  }

  @override
  Widget build(BuildContext context) {
    //return Container(height: 0);
    if ( CheckPlatform().isMobile ) {
      return FutureBuilder<NativeAd>(
        future: nativeAdCompleter.future,
        builder: (BuildContext context, AsyncSnapshot<NativeAd> snapshot) {
          Widget child;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              child = Container(/*child: _widgetAddLocal*/);
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                child = AdWidget(ad: _nativeAd!);
              }else {
                child = Container(/*child: _widgetAddLocal*/);
              }
          }
          return Tooltip(message: 'Native Ad Pub', child: child);
        },
      );
    }
    return Container(/*child: _widgetAddLocal*/);
  }
}
