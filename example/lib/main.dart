import 'package:brain_dev_business/config/dependencies_tools.dart';
import 'package:brain_dev_google_ads/variables_instance.dart';
import 'package:brain_dev_google_ads_example/my_app_config.dart';
import 'package:brain_dev_tools/I10n/l10n.dart';
import 'package:brain_dev_tools/config/I10n/assets_locale_l10n.dart';
import 'package:brain_dev_tools/config/app_config.dart';
import 'package:brain_dev_tools/config/dependencies_tools.dart';
import 'package:brain_dev_tools/controllers/localization_controller.dart';
import 'package:brain_dev_tools/controllers/theme_controller.dart';
// import 'package:brain_dev_tools/tools/utils/messages.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
// import 'package:flutter_flavor/flutter_flavor.dart';
// import 'package:get/get.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/services.dart';
import 'package:brain_dev_google_ads/brain_dev_google_ads.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if( EnvironmentVariable.urlApiServer.isEmpty){
    MyAppConfig.setProdData();
  }

  Map<String, Map<String, String>> languages = await AssetsLocaleL10n.appTranslatorWithMerge();
  await initBrainDevToolsDependencies();
  initBusinessDependencies();
  await initBrainDevGoogleAds();

  initBrainDevGoogleAds();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _brainDevGoogleAdsPlugin = BrainDevGoogleAds();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _brainDevGoogleAdsPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return GetMaterialApp(
          navigatorObservers: [
            FlutterSmartDialog.observer,
            BotToastNavigatorObserver()
          ],
          //navigatorObservers: [BotToastNavigatorObserver()],
          //builder: FlutterSmartDialog.init(),
          builder: BotToastInit(),
          title: EnvironmentVariable.appName,
          navigatorKey: Get.key,
          //theme: themeController.isBrightnessDark ? dark : light,
          theme: ThemeData(
            brightness: themeController.brightness,
            primarySwatch: themeController.colorTheme,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            useMaterial3: false,
          ),
          //debugShowCheckedModeBanner: false,
          //themeController.darkTheme ? dark : light,
          locale: localizeController.locale,
          //translations: Messages(languages: widget.languages!),
          fallbackLocale: Locale(L10n.langFrancais.languageCode, L10n.langFrancais.countryCode),
          initialRoute: '/',//RouteName.homeDefault,//_initialLink,//
          //getPages: Routes.allRoutes,
          defaultTransition: Transition.rightToLeft,//Transition.topLevel,
          //initialBinding: InitialBinding(),
          transitionDuration: const Duration(milliseconds: 500),
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Plugin example app'),
            ),
            body: Center(
              child: Column(
                children: [
                  Text('Running on: $_platformVersion\n'),
                  senderGoogleAdsService.getWidgetBanner(),
                  senderGoogleAdsService.getWidgetBannerLargeBanner(),
                  senderGoogleAdsService.getWidgetBannerMediumRectangle(),
                  senderGoogleAdsService.getWidgetAdsMediumRectangle(),
                ],
              ),
            ),
            bottomNavigationBar: senderGoogleAdsService.getWidgetBanner(),
          ),
        );
      });
    });
  }
}
