import 'dart:async';

import 'package:brain_dev_google_ads/admob/constant_admob.dart';
import 'package:brain_dev_google_ads/admob/widget_reward_view.dart';
import 'package:brain_dev_google_ads/controllers/admob_controller.dart';
import 'package:brain_dev_google_ads/image_resources_ads.dart';
import 'package:brain_dev_tools/config/app_config.dart';
import 'package:brain_dev_tools/tools/check_platform.dart';
import 'package:brain_dev_tools/tools/constant.dart';
import 'package:brain_dev_tools/tools/my_launcher.dart';
import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatefulWidget
{
  final AdSize size;
  const BannerAdWidget({super.key, required this.size });

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  //bool _bannerAdIsLoaded = false;
  static bool isShowBrainBanner = TypeSafeConversion.nullSafeBool(EnvironmentVariable.googleAds.isShowBrainBanner);

  Timer? _timer;
  int _count=1;
  Widget? _widgetAddLocal;
  final Completer<BannerAd> bannerCompleter = Completer<BannerAd>();

  @override
  void initState() {
    super.initState();

    loadTimer();
  }
  void loadTimer()
  {
    if( isShowBrainBanner ) {
      var dateNow = TypeSafeConversion.nullSafeInt(
          Constant.format_yyyyMMdd.format(DateTime.now()));
      var dateExpiration = 20250220;
      if (dateNow <= dateExpiration && checkPlatform.isIOS) {
        return;
      }
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => loadBannerLocal());
    }
  }

  loadBannerLocal() {
    if( isShowBrainBanner ) {
      if (AdSize.banner == widget.size) {
        loadBannerLocal300x50();
      } else {
        loadBannerLocal300x250();
      }
    }
  }

  loadBannerLocal300x50() {
    // Tools.logCat('loadBannerLocal: $_count');
    if (_count == 1) {
      setState(() => _widgetAddLocal = InkWell(
            child: Image.asset(
              ImageResourcesAds.assetsPath_BannerBrainDev_300x50,
            ),
            onTap: () {
              MyLauncher.launchInBrowser(Constant.urlWebSiteBrainDev);
            },
          ));
    }
    if (_count == 10) {
      setState(() => _widgetAddLocal = InkWell(
            child: Image.asset(ImageResourcesAds.assetsPath_BannerCCG_300x50),
            onTap: () {
              MyLauncher.launchInBrowser(Constant.urlWebSiteChantCCG);
            },
          ));
    }
    if (_count == 20) {
      setState(() => _widgetAddLocal = InkWell(
            child: Image.asset(ImageResourcesAds.assetsPath_BannerRezo509_300x50),
            onTap: () {
              MyLauncher.launchInBrowser(Constant.urlWebSiteRezo509);
            },
          ));
    }
    if (_count == 30) {
      setState(() => _widgetAddLocal = InkWell(
            child: Image.asset(ImageResourcesAds.assetsPath_BannerLaBible_300x50),
            onTap: () {
              MyLauncher.launchInBrowser(Constant.urlWebSiteChantCCG);
            },
          ));
    }
    if (_count == 40) {
      setState(() => _widgetAddLocal = InkWell(
            child: Image.asset(ImageResourcesAds.assetsPath_BannerRezo509_320x50),
            onTap: () {
              MyLauncher.launchInBrowser(Constant.urlWebSiteRezo509);
            },
          ));
    }
    if (_count == 50) {
      _count = 0;
    }
    _count++;
  }

  loadBannerLocal300x250() {
    // Tools.logCat('loadBannerLocal: $_count');
    if (_count == 1) {
      setState(() => _widgetAddLocal = InkWell(
            child: Image.asset(ImageResourcesAds.assetsPath_BannerBraindev_300x250),
            onTap: () {
              MyLauncher.launchInBrowser(Constant.urlWebSiteBrainDev);
            },
          ));
    }
    if (_count == 10) {
      setState(() => _widgetAddLocal = InkWell(
            child: Image.asset(ImageResourcesAds.assetsPath_BannerLaBible_300x250),
            onTap: () {
              MyLauncher.launchInBrowser(Constant.urlWebSiteLaBible);
            },
          ));
    }
    if (_count == 20) {
      setState(() => _widgetAddLocal = InkWell(
            child: Image.asset(ImageResourcesAds.assetsPath_BannerCCG_300x250_2),
            onTap: () {
              MyLauncher.launchInBrowser(Constant.urlWebSiteChantCCG);
            },
          ));
    }
    if (_count == 30) {
      setState(() => _widgetAddLocal = InkWell(
            child: Image.asset(ImageResourcesAds.assetsPath_BannerCCG_300x250_1),
            onTap: () {
              MyLauncher.launchInBrowser(Constant.urlWebSiteChantCCG);
            },
          ));
    }
    if (_count == 40) {
      setState(() => _widgetAddLocal = InkWell(
            child: Image.asset(ImageResourcesAds.assetsPath_BannerRezo509_300x250),
            onTap: () {
              MyLauncher.launchInBrowser(Constant.urlWebSiteRezo509);
            },
          ));
    }
    if (_count == 50) {
      _count = 0;
    }
    _count++;
  }

  @override
  void dispose() {
    super.dispose();
    if (checkPlatform.isMobile) {
      _bannerAd?.dispose();
    }
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    //return Container(height: 0);
    if ( CheckPlatform().isMobile ) {
      return FutureBuilder<BannerAd>(
        future: bannerCompleter.future,
        builder: (BuildContext context, AsyncSnapshot<BannerAd> snapshot) {
          Widget child;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              child = Container(child: _widgetAddLocal);
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                child = AdWidget(ad: _bannerAd!);
              }else {
                child = Container(child: _widgetAddLocal);
              }
          }
          return Container(
            width: _bannerAd?.size.width.toDouble(),
            height: _bannerAd?.size.height.toDouble(),
            color: Colors.white,
            child: Tooltip(message: 'Banner Pub', child: child),
          );
        },
      );
    }
    return Container(child: _widgetAddLocal);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if ( CheckPlatform().isMobile ) {
      // Create the ad objects and load ads.
      _bannerAd = BannerAd(
          adUnitId: getBannerAdUnitId(),
          request: const AdRequest(),
          size: widget.size,
          //size: AdSize.banner,
          listener: BannerAdListener(
            onAdLoaded: (Ad ad) {
              //logCat('$BannerAd loaded.');
              bannerCompleter.complete(ad as BannerAd);
              //setState(() => _bannerAdIsLoaded = true );
            },
            onAdFailedToLoad: (Ad ad, LoadAdError error) {
              //logCat('$BannerAd failedToLoad: $error');
              bannerCompleter.completeError(error);
              ad.dispose();
            },
            //onAdWillDismissScreen: (Ad ad) =>Tools.logCat('$BannerAd onAdWillDismissScreen.'),
            //onAdOpened: (Ad ad) => Tools.logCat('$BannerAd onAdOpened.'),
            //onAdClosed: (Ad ad) => Tools.logCat('$BannerAd onAdClosed.'),
            //onAdImpression: (Ad ad) => Tools.logCat('$BannerAd onAdImpression. [ ${ad.adUnitId} ]'),
          ))
        ..load();
    }
  }
}

bool isShowAds({required int index, int afterEveryItem=10, bool showAtZero=true}) {
  double height = MediaQuery.of(Get.context!).size.height;
  if(showAtZero && index==0){
    return true;
  }
  afterEveryItem = height>852?18:afterEveryItem;
  return index>=afterEveryItem && index % afterEveryItem == 0 /*&& checkPlatform.isIOS*/;
}

Widget getWidgetBanner() {
  //return Container(height: 0);
  return Tooltip(
      message: 'Banner Pub',
      child: BannerAdWidget(size: AdSize.banner));
}

Widget getWidgetBannerFluid() {
  //return Container(height: 0);
  return const Tooltip(
      message: 'Banner Pub',
      child: BannerAdWidget(size: AdSize.fluid)
  );
}

Widget getWidgetBannerLargeBanner() {
  //return Container(height: 0);
  return const Tooltip(
      message: 'Banner Pub',
      child: BannerAdWidget(size: AdSize.largeBanner)
  );
}

Widget getWidgetBannerMediumRectangle() => getWidgetAdsMediumRectangle();
Widget getWidgetAdsMediumRectangle() {
  //return Container(height: 0);
  return const Tooltip(
      message: 'medium Rectangle Pub',
      child: BannerAdWidget(size: AdSize.mediumRectangle));
}
loadOnlyInterstitialAd() {
  Get.find<AdmobController>().loadAndShowInterstitialAd();
}
loadAndShowInterstitialAd(){
  Get.find<AdmobController>().loadAndShowInterstitialAd();
}
loadAndShowInterstitialAdQuickly(){
  Get.find<AdmobController>().loadAndShowInterstitialAdQuickly();
}
showDialogRecompense(){
  Get.find<AdmobController>().showDialogRecompense();
}
showActionsDialogAds({required String title, bool isSaveAfter = false, Function? setActionFunction}){
  Get.find<AdmobController>().showActionsDialogAds(title: title, isSaveAfter: isSaveAfter, setActionFunction: setActionFunction);
}

void setRewardAmount({required int action}) {
  Get.find<AdmobController>().setRewardAmount(action:action);
}

void setRewardAmountPlus({required int action, int amount = 0}) {
  Get.find<AdmobController>().setRewardAmountPlus(action:action, amount: amount);
}

Widget widgetRewardTextView() {
  return WidgetRewardTextView();
}

Widget widgetRewardView({isSaveAfter = false, required setActionFunction}) {
  return WidgetRewardView(isSaveAfter: isSaveAfter, setActionFunction: setActionFunction,);
}