import 'package:brain_dev_google_ads/controllers/admob_controller.dart';
import 'package:brain_dev_tools/tools/Enum/enum.dart';
import 'package:brain_dev_google_ads/admob/constant_admob.dart';
import 'package:brain_dev_tools/tools/check_platform.dart';
import 'package:brain_dev_tools/tools/my_elevated_button.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:brain_dev_tools/tools/tools_widget.dart';
import 'package:brain_dev_tools/tools/utils/image_icon_resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class VideoRewardDialog extends StatefulWidget {
  const VideoRewardDialog(
      {super.key,
      this.adsTypeEnum = AdsTypeEnum.RewardAds,
      required this.color,
      required this.title});
  final String title;
  final Color color;
  final AdsTypeEnum adsTypeEnum;

  @override
  State<VideoRewardDialog> createState() => _VideoRewardDialogState();
}

class _VideoRewardDialogState extends State<VideoRewardDialog> {
  //region [ ATTRIBUTS ]
  bool _isBrightnessDark = false;
  Color _color = Colors.deepOrange;
  String _title = '';

  //int _recompenseAds=0;
  bool _showProgressBarRewarded = false;
  bool _showProgressBarRewardedInterstitial = false;

  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  // bool _interstitialReady = false;
  RewardedAd? _rewardedAd;

  //bool _rewardedReady = false;
  int _numRewardedLoadAttempts = 0;
  RewardedInterstitialAd? _rewardedInterstitialAd;
  //bool _rewardedInterstitialReady = false;
  int _numRewardedInterstitialLoadAttempts = 0;
  //endregion

  @override
  void initState() {
    super.initState();

    initData();
  }

  initData() async {
    try {
      _color = widget.color;
      _title = widget.title;
      await initRewardedVideoAd();
      //loadRewardedVideoAdListener();
    } catch (ex, trace) {
      logError(ex, trace: trace, position: 'initData');
    }
  }

  Future<void> initRewardedVideoAd() async {
    try {
      setShowProgressBarRewardedInterstitial();
      await _createRewardedInterstitialAd();

      setShowProgressBarRewarded();
      await _createRewardedAd();
    } catch (ex, trace) {
      logError(ex, trace: trace, position: 'initData');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
    _rewardedInterstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            // gradient: LinearGradient(
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //     stops: const [0.1, 0.8],
            //     colors: [_color, Colors.black]
            // ),
          ),
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 8),
          child: Text('label_video_avec_recompense'.tr, textAlign: TextAlign.center,
            //style: TextStyle(color: ColorResources.getColorOrSetPrimaryColor()),
          )),
      titlePadding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0, bottom: 0),
      contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0, bottom: 0),
      content: SizedBox(
        height: 140,
        child: GetBuilder<AdmobController>(builder: (admobCtr) {
          return Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Divider(
                    color: Colors.grey.shade600,
                  )),
                  const SizedBox(width: 10.0),
                  Text(
                    _title,
                    style: TextStyle(
                        color: ToolsWidget().getColor(
                            color: _color, isDark: _isBrightnessDark)),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                      child: Divider(
                    color: Colors.grey.shade600,
                  )),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Text(
                      'msg_infoTitle_ActionSaveOnTheCloud'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
                    ),
                    Text('msg_infoSubTitle_ActionSaveOnTheCloud'.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 14)),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Divider(
                          color: Colors.grey.shade600,
                        )),
                        const SizedBox(width: 10.0),
                        Text('${'msg_Reward_earned'.tr} : ',
                            textAlign: TextAlign.center,
                            style: ToolsWidget().styleReward(fontSize: 14)),
                        Image.asset(
                          ImageIconResources.assetsCoinStarPath,
                          width: 20,
                        ),
                        Text('${admobCtr.recompenseAds}',
                            textAlign: TextAlign.center,
                            style: ToolsWidget().styleReward(fontSize: 14)),
                        // Text('$_recompenseAds', textAlign: TextAlign.center,
                        //     style: ToolsWidget().styleReward(context, isDark:_isBrightnessDark ) ),
                        const SizedBox(width: 10.0),
                        Expanded(
                            child: Divider(
                          color: Colors.grey.shade600,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
      actions: <Widget>[
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
              onPressed: _rewardedInterstitialAd == null
                  ? null
                  : () {
                      showRewardedInterstitialAd();
                    },
              style: elevatedButtonNormal(backgroundColor: Colors.teal),
              icon: (_showProgressBarRewardedInterstitial)
                  ? const CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      strokeWidth: 3,
                    )
                  : const Icon(Icons.ads_click),
              label: Text(
                'label_ads_with_reward'.trParams({
                      'nbrAds': '10',
                      'nbrBcUp': '1'
                    }),
                textAlign: TextAlign.center,
              )),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
              onPressed: _rewardedAd == null
                  ? null
                  : () {
                      showRewardedAd();
                    },
              style: elevatedButtonNormal(backgroundColor: Colors.blueGrey),
              icon: (_showProgressBarRewarded)
                  ? const CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      strokeWidth: 3,
                    )
                  : const Icon(Icons.ads_click),
              label: Text(
                  'label_ads_with_reward'.trParams({
                        'nbrAds': '30',
                        'nbrBcUp': '3'
                      }),
                  textAlign: TextAlign.center)),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            child: Text('label_close'.tr),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ),
      ],
    );
  }

  //region [ Interstitial Ad ]
  void _createInterstitialAd() {
    if (CheckPlatform().isMobile) {
      InterstitialAd.load(
          adUnitId: getInterstitielAdUnitId(),
          request: request,
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              logCat('${ad.runtimeType} loaded.');
              // _interstitialReady = true;
              _interstitialAd = ad;
              _numInterstitialLoadAttempts = 0;
              _interstitialAd!.setImmersiveMode(true);
            },
            onAdFailedToLoad: (LoadAdError error) {
              logCat('InterstitialAd failed to load: $error.');
              _numInterstitialLoadAttempts += 1;
              _interstitialAd = null;
              if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
                _createInterstitialAd();
              }
            },
          ));
    }
  }

  void showInterstitialAd() {
    if (_interstitialAd == null) {
      logCat('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          logCat('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        logCat('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        logCat('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  //endregion

  //region [ Rewarded Interstitial Ad ]
  Future<void> _createRewardedInterstitialAd() async {
    setShowProgressBarRewardedInterstitial();
    await RewardedInterstitialAd.load(
        adUnitId: getRewardedInterstitialAdUnitId(),
        request: request,
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
          onAdLoaded: (RewardedInterstitialAd ad) {
            logCat('$ad loaded.');
            _rewardedInterstitialAd = ad;
            _numRewardedInterstitialLoadAttempts = 0;
            setShowProgressBarRewardedInterstitial(show: false);
          },
          onAdFailedToLoad: (LoadAdError error) {
            logCat('RewardedInterstitialAd failed to load: $error');
            setShowProgressBarRewardedInterstitial(show: false);
            _rewardedInterstitialAd = null;
            _numRewardedInterstitialLoadAttempts += 1;
            if (_numRewardedInterstitialLoadAttempts <= maxFailedLoadAttempts) {
              _createRewardedInterstitialAd();
            }
          },
        ));
    //
  }

  void showRewardedInterstitialAd() {
    if (_rewardedInterstitialAd == null) {
      logCat('Warning: attempt to show rewarded interstitial before loaded.');
      setShowProgressBarRewardedInterstitial();
      return;
    }
    _rewardedInterstitialAd!.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedInterstitialAd ad) =>
          logCat('$ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
        logCat('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createRewardedInterstitialAd();
      },
      onAdFailedToShowFullScreenContent:
          (RewardedInterstitialAd ad, AdError error) {
        logCat('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedInterstitialAd();
      },
    );

    _rewardedInterstitialAd!.setImmersiveMode(true);
    _rewardedInterstitialAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) async {
      logCat(
          '$RewardedAd [$ad] with reward $RewardItem(${reward.amount}, ${reward.type})');
      Get.find<AdmobController>()
          .setRewardAmountPlus(action: 1, amount: reward.amount.toInt());
      setShowProgressBarRewardedInterstitial(show: false);
    });
    _rewardedInterstitialAd = null;
    setShowProgressBarRewardedInterstitial(show: false);
  }

  //endregion

  //region [ Rewarded Ad ]
  Future<void> _createRewardedAd() async {
    setShowProgressBarRewarded(show: true);
    await RewardedAd.load(
        adUnitId: getRewardedVideoAdUnitId(),
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            logCat('$ad loaded.');
            _rewardedAd = ad;
            _numRewardedLoadAttempts = 0;
            setShowProgressBarRewarded(show: false);
            // _rewardedReady = true;
          },
          onAdFailedToLoad: (LoadAdError error) {
            logCat('RewardedAd failed to load: $error');
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            setShowProgressBarRewarded(show: false);
            if (_numRewardedLoadAttempts <= maxFailedLoadAttempts) {
              _createRewardedAd();
            }
          },
        ));
    //setShowProgressBarRewarded(show: false);
  }

  void showRewardedAd() {
    setShowProgressBarRewarded(show: true);
    if (_rewardedAd == null) {
      logCat('Warning: attempt to show rewarded before loaded.');
      setShowProgressBarRewarded(show: false);
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          logCat('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        logCat('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        logCat('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedAd();
      },
    );
    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) async {
      logCat(
          '$RewardedAd [$ad] with reward $RewardItem(${reward.amount}, ${reward.type})');
      Get.find<AdmobController>()
          .setRewardAmountPlus(action: 1, amount: reward.amount.toInt());
      setShowProgressBarRewarded(show: false);
      showDialogRecompense();
    });
    _rewardedAd = null;
    setShowProgressBarRewarded(show: false);
  }

  //endregion

  showDialogRecompense() {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      ImageIconResources.assetsCoinPath,
                      width: 300,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          'msg_you_receive_reward'.tr,
                          style: const TextStyle(color: Colors.teal),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }

  setShowProgressBarRewarded({bool show = true}) {
    setState(() => _showProgressBarRewarded = show);
  }

  setShowProgressBarRewardedInterstitial({bool show = true}) {
    setState(() => _showProgressBarRewardedInterstitial = show);
  }
}
