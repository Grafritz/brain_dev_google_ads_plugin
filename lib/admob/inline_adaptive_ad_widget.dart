import 'package:brain_dev_google_ads/admob/constant_admob.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InlineAdaptiveAdWidget extends StatefulWidget {
  const InlineAdaptiveAdWidget({super.key});

  @override
  State<InlineAdaptiveAdWidget> createState() => _InlineAdaptiveAdWidgetState();
}

class _InlineAdaptiveAdWidgetState extends State<InlineAdaptiveAdWidget> {
  static const _insets = 16.0;
  AdManagerBannerAd? inlineAdaptiveAd;
  bool isLoaded = false;
  AdSize? adSize;
  late Orientation currentOrientation;

  double get _adWidth => MediaQuery.of(context).size.width - (2 * _insets);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentOrientation = MediaQuery.of(context).orientation;
    loadAd();
  }
  void loadAd() async {
    await inlineAdaptiveAd?.dispose();
    setState(() {
      inlineAdaptiveAd = null;
      isLoaded = false;
    });

    // Get an inline adaptive size for the current orientation.
    AdSize size = AdSize.getCurrentOrientationInlineAdaptiveBannerAdSize(
        _adWidth.truncate());

    inlineAdaptiveAd = AdManagerBannerAd(
      adUnitId: getBannerAdUnitId(),
      sizes: [size],
      request: AdManagerAdRequest(),
      listener: AdManagerBannerAdListener(
        onAdLoaded: (Ad ad) async {
          logCat('Inline adaptive banner loaded: ${ad.responseInfo}');

          // After the ad is loaded, get the platform ad size and use it to
          // update the height of the container. This is necessary because the
          // height can change after the ad is loaded.
          AdManagerBannerAd bannerAd = (ad as AdManagerBannerAd);
          final AdSize? size = await bannerAd.getPlatformAdSize();
          if (size == null) {
            logCat('Error: getPlatformAdSize() returned null for $bannerAd');
            return;
          }

          setState(() {
            inlineAdaptiveAd = bannerAd;
            isLoaded = true;
            adSize = size;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          logCat('Inline adaptive banner failedToLoad: $error');
          ad.dispose();
        },
      ),
    );
    await inlineAdaptiveAd!.load();
  }

  /// Gets a widget containing the ad, if one is loaded.
  ///
  /// Returns an empty container if no ad is loaded, or the orientation
  /// has changed. Also loads a new ad if the orientation changes.
  Widget _getAdWidget() {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (currentOrientation == orientation &&
            inlineAdaptiveAd != null &&
            isLoaded &&
            adSize != null) {
          return Align(
              child: SizedBox(
                width: _adWidth,
                height: adSize!.height.toDouble(),
                child: AdWidget(
                  ad: inlineAdaptiveAd!,
                ),
              ));
        }
        // Reload the ad if the orientation changes.
        if (currentOrientation != orientation) {
          currentOrientation = orientation;
          loadAd();
        }
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Inline adaptive banner example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: _insets),
          child: ListView.separated(
            itemCount: 3,
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 40,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              if (index == 1) {
                return _getAdWidget();
              }
              return Text(placeholderText, style: TextStyle(fontSize: 24));
            },
          ),
        ),
      ));

  @override
  void dispose() {
    super.dispose();
    inlineAdaptiveAd?.dispose();
  }
  static const String placeholderText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod'
      ' tempor incididunt ut labore et dolore magna aliqua. Faucibus purus in'
      ' massa tempor. Quis enim lobortis scelerisque fermentum dui faucibus'
      ' in. Nibh praesent tristique magna sit amet purus gravida quis.'
      ' Magna sit amet purus gravida quis blandit turpis cursus in. Sed'
      ' adipiscing diam donec adipiscing tristique. Urna porttitor rhoncus'
      ' dolor purus non enim praesent. Pellentesque habitant morbi tristique'
      ' senectus et netus. Risus ultricies tristique nulla aliquet enim tortor'
      ' at.';
}
