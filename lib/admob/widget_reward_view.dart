import 'package:brain_dev_google_ads/controllers/admob_controller.dart';
import 'package:brain_dev_google_ads/image_resources_ads.dart';
import 'package:brain_dev_google_ads/src/ads_support.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetRewardTextView extends StatelessWidget {
  const WidgetRewardTextView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdmobController>(builder: (admobCtr) {
      return Row(
        children: <Widget>[
          Expanded(
              child: Divider(
            color: Colors.grey.shade600,
          )),
          const SizedBox(width: 10.0),
          Text('${'msg_Reward_earned'.tr} : ',
              textAlign: TextAlign.center, style: adsRewardStyle()),
          Image.asset(ImageResourcesAds.assetsCoinStarPath,width: 15,),
          Text('${admobCtr.recompenseAds}',
              textAlign: TextAlign.center, style: adsRewardStyle()),
          const SizedBox(width: 10.0),
          Expanded(
              child: Divider(
            color: Colors.grey.shade600,
          )),
        ],
      );
    });
  }
}

class WidgetRewardView extends StatelessWidget {
  const WidgetRewardView({super.key, this.isSaveAfter = false, required this.setActionFunction});

  final bool isSaveAfter;
  /// Action choisie par l'application après la récompense (valeur propre à l'application, non interprétée ici).
  final Object? setActionFunction;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdmobController>(builder: (admobCtr) {
      return Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(
                      '${'msg_infoTitle_ActionSaveOnTheCloud'.tr}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Text('${'msg_infoSubTitle_ActionSaveOnTheCloud'.tr}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: adsButtonStyle(backgroundColor: Colors.blueGrey),
                    icon: Icon(Icons.ads_click, color: Colors.white),
                    label: Text('label_Regarder_la_video'.tr,
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    onPressed: () {
                      Get.find<AdmobController>().showActionsDialogAds(
                          title: 'app_name'.tr,
                          isSaveAfter: isSaveAfter,
                          //setActionFunction: setActionFunction,
                          setActionFunction: null,
                      );
                    },
                  )),
            ],
          ),
        ),
      );
    });
  }
}
