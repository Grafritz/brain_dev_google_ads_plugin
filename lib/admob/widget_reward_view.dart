import 'package:brain_dev_google_ads/controllers/admob_controller.dart';
import 'package:brain_dev_google_ads/image_resources_ads.dart';
import 'package:brain_dev_tools/I10n/localization_constants.dart';
import 'package:brain_dev_tools/tools/enum/enum.dart';
import 'package:brain_dev_tools/tools/my_elevated_button.dart';
import 'package:brain_dev_tools/tools/tools_widget.dart';
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
          Text('${tr('msg_Reward_earned')} : ',
              textAlign: TextAlign.center, style: ToolsWidget().styleReward()),
          Image.asset(ImageResourcesAds.assetsCoinStarPath,width: 15,),
          Text('${admobCtr.recompenseAds}',
              textAlign: TextAlign.center, style: ToolsWidget().styleReward()),
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
  final SetActionFunction setActionFunction;

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
                      '${tr('msg_infoTitle_ActionSaveOnTheCloud')}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Text('${tr('msg_infoSubTitle_ActionSaveOnTheCloud')}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: elevatedButtonNormal(backgroundColor: Colors.blueGrey),
                    icon: Icon(Icons.ads_click, color: Colors.white),
                    label: Text(tr('label_Regarder_la_video'),
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    onPressed: () {
                      Get.find<AdmobController>().showActionsDialogAds(
                          title: tr('app_name'),
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
