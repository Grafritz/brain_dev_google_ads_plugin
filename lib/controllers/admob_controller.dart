import 'package:brain_dev_tools/I10n/localization_constants.dart';
import 'package:brain_dev_google_ads/admob/constant_admob.dart';
import 'package:brain_dev_google_ads/admob/video_reward_dialog.dart';
import 'package:brain_dev_tools/tools/check_platform.dart';
import 'package:brain_dev_tools/tools/enum/enum.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:brain_dev_tools/tools/utils/image_icon_resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdmobController extends GetxController implements GetxService
{
  //region [ VARIABLES ]
  int rewardAmount = 10;
  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  AppOpenAd? appOpenAd;
  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;

  RewardedInterstitialAd? _rewardedInterstitialAd;
  int _numRewardedInterstitialLoadAttempts = 0;

  bool _showProgressBar = false;

  bool get showProgressBar => _showProgressBar;

  setShowProgressBar({required bool show}) {
    _showProgressBar = show;
    update();
  }
  //endregion

  final SharedPreferences sharedPreferences;

  AdmobController({required this.sharedPreferences}) {
    //if (!_started) {
    initAdMob();
    //  _started = true;
    //}
  }

  initAdMob() {
    createInterstitialAd();
    createRewardedAd();
    createRewardedInterstitialAd();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
    super.dispose();
  }

  //region [ AppOpen App ]
  Future createAppOpenAd({bool showAfter = false}) async {
    if (checkPlatform.isMobile) {
      await AppOpenAd.load(
        adUnitId: getAppOpenAdUnitId(),
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
          logCat('ad is loaded');
          appOpenAd = ad;
          if (showAfter) {
            showAppOpenAd();
          }
        }, onAdFailedToLoad: (error) {
          logCat('ad failed to load $error');
        }),
      );
    }
  }

  void showAppOpenAd() {
    if (appOpenAd == null) {
      logCat('trying tto show before loading');
      createAppOpenAd();
      return;
    }
    appOpenAd!.fullScreenContentCallback =
        FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
      logCat('onAdShowedFullScreenContent');
    }, onAdFailedToShowFullScreenContent: (ad, error) {
      ad.dispose();
      logCat('failed to load $error');
      appOpenAd = null;
      createAppOpenAd();
    }, onAdDismissedFullScreenContent: (ad) {
      ad.dispose();
      logCat('dismissed');
      appOpenAd = null;
      createAppOpenAd();
    });
    appOpenAd!.show();
  }

  //endregion

  void initRewardedVideoAd() {
    try {
      MobileAds.instance.initialize().then((InitializationStatus status) {
        //logCat('Initialization done: ${status.adapterStatuses[0]?.description}');
        MobileAds.instance
            .updateRequestConfiguration(RequestConfiguration(
                tagForChildDirectedTreatment:
                    TagForChildDirectedTreatment.unspecified))
            .then((value) {
          logCat('MobileAds.instance');
          createInterstitialAd();
          createRewardedAd();
        });
      });
    } catch (ex, trace) {
      logError(ex, trace: trace, position: 'initRewardedVideoAd');
    }
  }

  //region [ RewardAmount ]
  int _recompenseAds = 0;
  int get recompenseAds => _recompenseAds;

  bool get isHaveRecompenseAds => _recompenseAds > 0;

  void setRewardAmount({required int action}) {
    if (action > 0) {
      _recompenseAds += rewardAmount;
    } else {
      _recompenseAds -= rewardAmount;
    }
    if (_recompenseAds < 0) {
      _recompenseAds = 0;
    }
    setRecompenseAds(_recompenseAds);
    update();
  }

  void setRewardAmountPlus({required int action, int amount = 0}) {
    if (action > 0) {
      _recompenseAds += amount;
    } else {
      _recompenseAds -= rewardAmount;
    }
    if (_recompenseAds < 0) {
      _recompenseAds = 0;
    }
    setRecompenseAds(_recompenseAds);
    update();
  }

  //endregion
  //region [ recompenseAds QR ]
  int _recompenseAdsQR = 0;

  int get recompenseAdsQR => _recompenseAdsQR;

  getRecompenseAds() async {
    _recompenseAds = sharedPreferences.getInt("RecompenseAds") ?? 20;
    if (kDebugMode) _recompenseAds = 100;
    //if (userConnected.havePrivilege) {
    //  _recompenseAds = 100;
    //}
    update();
  }

  setRecompenseAds(int value) async {
    _recompenseAds = value;
    sharedPreferences.setInt("RecompenseAds", value);
    update();
  }

  getRecompenseAdsQR() async {
    _recompenseAdsQR = sharedPreferences.getInt("RecompenseAdsQR") ?? 20;
    update();
  }

  setRecompenseAdsQR(int value) async {
    _recompenseAdsQR = value;
    sharedPreferences.setInt("RecompenseAdsQR", value);
    update();
  }

  //endregion

  //region [ InterstitialAd ]
  Future createInterstitialAd({bool showAfter = false}) async {
    setShowProgressBar(show: true);
    if (checkPlatform.isMobile) {
      await InterstitialAd.load(
          adUnitId: getInterstitielAdUnitId(),
          request: request,
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              logCat('${ad.runtimeType} loaded.');
              // _interstitialReady = true;
              _interstitialAd = ad;
              _numInterstitialLoadAttempts = 0;
              _interstitialAd!.setImmersiveMode(true);
              //ad.show();
              setShowProgressBar(show: false);
            },
            onAdFailedToLoad: (LoadAdError error) {
              logCat('InterstitialAd failed to load: $error.');
              _numInterstitialLoadAttempts += 1;
              _interstitialAd = null;
              if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
                createInterstitialAd();
              }
            },
          ));
      if (showAfter) {
        showInterstitialAd();
      }
    }
  }

  void showInterstitialAd() async {
    if (checkPlatform.isMobile) {
      if (_interstitialAd == null) {
        logCat('Warning: attempt to show interstitial before loaded.');
        //createInterstitialAd(showAfter: true);
        return;
      }
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) => logCat('ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          logCat('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
          createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          logCat('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          createInterstitialAd();
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    }
  }

//endregion

  //region [ RewardedVideoAd ]
  void createRewardedAd() {
    if (checkPlatform.isMobile) {
      setShowProgressBar(show: true);
      RewardedAd.load(
          adUnitId: getRewardedVideoAdUnitId(),
          request: request,
          rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (RewardedAd ad) {
              logCat('$ad loaded.');
              _rewardedAd = ad;
              _numRewardedLoadAttempts = 0;
              // _rewardedReady = true;
              setShowProgressBar(show: false);
            },
            onAdFailedToLoad: (LoadAdError error) {
              logCat('RewardedAd failed to load: $error');
              _rewardedAd = null;
              _numRewardedLoadAttempts += 1;
              if (_numRewardedLoadAttempts <= maxFailedLoadAttempts) {
                createRewardedAd();
              }
            },
          ));
    }
  }

  showRewardedVideoAd() {
    if (checkPlatform.isMobile) {
      //setShowProgressBar(show: true);
      if (_rewardedAd == null) {
        logCat('Warning: attempt to show rewarded before loaded.');
        return;
      }
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (RewardedAd ad) =>
            logCat('ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (RewardedAd ad) {
          logCat('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
          createRewardedAd();
        },
        onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
          logCat('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          createRewardedAd();
        },
      );

      _rewardedAd!.setImmersiveMode(true);
      _rewardedAd!.show(onUserEarnedReward: onUserEarnedReward);
      //   _rewardedAd!.show(onUserEarnedReward: (RewardedAd ad, RewardItem reward) {
      //   logCat( '$RewardedAd [$ad] with reward $RewardItem(${reward.amount}, ${reward.type})' );
      //   //setState(() {
      //     _recompenseAds += rewardAmount;
      //     setRecompenseAds(_recompenseAds);
      //   //});
      //   showDialogRecompense();
      //   //setShowProgressBar(show: false);
      // });
      // _rewardedReady = false;
      _rewardedAd = null;
    }
  }

  onUserEarnedReward(AdWithoutView ad, RewardItem reward) async {
    await getRecompenseAds();
    logCat(
        '$RewardedAd [$ad] with reward $RewardItem(${reward.amount}, ${reward.type})');
    setRewardAmount(action: 1);
    showDialogRecompense();
    //setShowProgressBar(show: false);
  }

  //endregion

//region [  ]
  void createRewardedInterstitialAd() {
    if (checkPlatform.isMobile) {
      RewardedInterstitialAd.load(
          adUnitId: getRewardedInterstitialAdUnitId(),
          request: request,
          rewardedInterstitialAdLoadCallback:
          RewardedInterstitialAdLoadCallback(
            onAdLoaded: (RewardedInterstitialAd ad) {
              logCat('$ad loaded.');
              _rewardedInterstitialAd = ad;
              _numRewardedInterstitialLoadAttempts = 0;
            },
            onAdFailedToLoad: (LoadAdError error) {
              logCat('RewardedInterstitialAd failed to load: $error');
              _rewardedInterstitialAd = null;
              _numRewardedInterstitialLoadAttempts += 1;
              if (_numRewardedInterstitialLoadAttempts <
                  maxFailedLoadAttempts) {
                createRewardedInterstitialAd();
              }
            },
          ));
    }
  }

  void showRewardedInterstitialAd() {
    if (CheckPlatform().isMobile) {
      if (_rewardedInterstitialAd == null) {
        logCat('Warning: attempt to show rewarded interstitial before loaded.');
        return;
      }
      _rewardedInterstitialAd!.fullScreenContentCallback =
          FullScreenContentCallback(
            onAdShowedFullScreenContent: (RewardedInterstitialAd ad) =>
                logCat('$ad onAdShowedFullScreenContent.'),
            onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
              logCat('$ad onAdDismissedFullScreenContent.');
              ad.dispose();
              createRewardedInterstitialAd();
            },
            onAdFailedToShowFullScreenContent:
                (RewardedInterstitialAd ad, AdError error) {
              logCat('$ad onAdFailedToShowFullScreenContent: $error');
              ad.dispose();
              createRewardedInterstitialAd();
            },
          );

      _rewardedInterstitialAd!.setImmersiveMode(true);
      _rewardedInterstitialAd!.show(
          onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
            logCat('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
          });
      _rewardedInterstitialAd = null;
    }
  }

//endregion

  //region recipe ClickCount
  int _nbrClickCount = 0;

  int get nbrClickCount => _nbrClickCount;

  int incrementAdClickCount() => _nbrClickCount++;

  resetAdClickCount() => _nbrClickCount = 0;

  //endregion
  loadAndShowInterstitialAd() async {
    incrementAdClickCount();
    //if (AppConfig.admobEnabled) {
    if (_nbrClickCount == 5) {
      resetAdClickCount();
      if (_interstitialAd == null) {
        await createInterstitialAd();
      }
      showInterstitialAd();
    }
    //}
  }
  loadAndShowInterstitialAdQuickly() async {
    if (_interstitialAd == null) {
      await createInterstitialAd();
    }
    showInterstitialAd();
  }

//region [  ]
//endregion

//region [ Re ]
  showDialogRecompense() {
    return showDialog(
        context: Get.context!,
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
                          '${tr('msg_you_receive_reward')}',
                          style: const TextStyle(color: Colors.teal),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }

//endregion

  showActionsDialogAds(
      {required String title,
      bool isSaveAfter = false,
      Function? setActionFunction}) async
  {
    showDialog<bool>(
            context: Get.context!,
            builder: (_) => VideoRewardDialog(color: Colors.teal, title: title))
        .then((value) async {
      if (isSaveAfter) {
        int recompense = await getRecompenseAds();
        if (recompense > 0) {
          if( setActionFunction!=null){
            setActionFunction;
          }
        }
      }
    });
  }

  showActionsDialogAds2(
      {required String title,
        bool isSaveAfter = false,
        SetActionFunction? setActionFunction}) async
  {
    showDialog<bool>(
        context: Get.context!,
        builder: (_) => VideoRewardDialog(color: Colors.teal, title: title))
        .then((value) async {
      if (isSaveAfter) {
        int recompense = await getRecompenseAds();
        if (recompense > 0) {
          switch (setActionFunction) {
            case SetActionFunction.saveChantUser:
              //await Get.find<ChantUserController>().saveChant(isSaveOnline: true);
              break;
            case SetActionFunction.saveGroupeUser:
              //await Get.find<GroupeUserController>().saveGroupe(isSaveOnline: true);
              break;
            case SetActionFunction.sendUserShare:
              //await Get.find<ShareWithMeController>().sendUserShare();
              break;
            case SetActionFunction.backUpOnlineChantUser:
            //await Get.find<ChantUserController>().backUpOnlineChantUser();
              break;
            default:
          }
        }
      }
    });
  }

}
