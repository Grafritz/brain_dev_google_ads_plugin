import 'package:brain_dev_business/services/sender_google_ads_service.dart';
import 'package:brain_dev_google_ads/admob/banner_ad_widget.dart';
import 'package:brain_dev_google_ads/admob/widget_reward_view.dart';
import 'package:brain_dev_google_ads/controllers/admob_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';

class SenderGoogleAdsServiceImpl implements SenderGoogleAdsService
{
  @override
  int get recompenseAds => Get.find<AdmobController>().recompenseAds;

  @override
  bool get isHaveRecompenseAds => Get.find<AdmobController>().isHaveRecompenseAds;

  @override
  bool isShowAds({required int index, int afterEveryItem=10, bool showAtZero=true}) {
    double height = MediaQuery.of(Get.context!).size.height;
    if(showAtZero && index==0){
      return true;
    }
    afterEveryItem = height>852?18:afterEveryItem;
    return index>=afterEveryItem && index % afterEveryItem == 0 /*&& checkPlatform.isIOS*/;
  }

  @override
  Widget getWidgetBanner() {
    //return Container(height: 0);
    return Tooltip(
        message: 'Banner Pub',
        child: BannerAdWidget(size: AdSize.banner));
  }

  @override
  Widget getWidgetBannerFluid() {
    //return Container(height: 0);
    return const Tooltip(
        message: 'Banner Pub',
        child: BannerAdWidget(size: AdSize.fluid)
    );
  }

  @override
  Widget getWidgetBannerLargeBanner() {
    //return Container(height: 0);
    return const Tooltip(
        message: 'Banner Pub',
        child: BannerAdWidget(size: AdSize.largeBanner)
    );
  }

  @override
  Widget getWidgetBannerMediumRectangle() => getWidgetAdsMediumRectangle();

  @override
  Widget getWidgetAdsMediumRectangle() {
    //return Container(height: 0);
    return const Tooltip(
        message: 'medium Rectangle Pub',
        child: BannerAdWidget(size: AdSize.mediumRectangle));
  }

  @override
  loadOnlyInterstitialAd() {
    Get.find<AdmobController>().loadAndShowInterstitialAd();
  }

  @override
  loadAndShowInterstitialAd(){
    Get.find<AdmobController>().loadAndShowInterstitialAd();
  }

  @override
  loadAndShowInterstitialAdQuickly(){
    Get.find<AdmobController>().loadAndShowInterstitialAdQuickly();
  }

  @override
  showDialogRecompense(){
    Get.find<AdmobController>().showDialogRecompense();
  }

  @override
  showActionsDialogAds({required String title, bool isSaveAfter = false, Function? setActionFunction}){
    Get.find<AdmobController>().showActionsDialogAds(title: title, isSaveAfter: isSaveAfter, setActionFunction: setActionFunction);
  }


  @override
  void setRewardAmount({required int action}) {
    Get.find<AdmobController>().setRewardAmount(action:action);
  }

  @override
  void setRewardAmountPlus({required int action, int amount = 0}) {
    Get.find<AdmobController>().setRewardAmountPlus(action:action, amount: amount);
  }

  @override
  Widget widgetRewardTextView() {
    return WidgetRewardTextView();
  }

  @override
  Widget widgetRewardView({isSaveAfter = false, required setActionFunction}) {
    return WidgetRewardView(isSaveAfter: isSaveAfter, setActionFunction: setActionFunction,);
  }

}