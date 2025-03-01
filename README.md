# brain_dev_google_ads

A Flutter project to manage Google Ads mobile.

## Getting Started

## Usage
Pour l'utiliser ajouter dans Main `googleAds.initBrainDevGoogleAds();`

```dart

import 'package:brain_dev_google_ads/config/dependencies_tools.dart' as googleAds;
import 'package:brain_dev_google_ads/app_open_ads.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  googleAds.initBrainDevGoogleAds();

  runApp(const MyApp());
}
```

## Additional information
Widget pour les banners
```dart
import 'package:brain_dev_google_ads/admob/banner_ad_widget.dart

getWidgetBanner(); 
BannerAdWidget(size: AdSize.banner);

getWidgetAdsMediumRectangle();
BannerAdWidget(size: AdSize.mediumRectangle);
```

```dart
bool isShowAds({required int index, int afterEveryItem=9, bool showAtZero=true});
Widget getWidgetBanner();
Widget getWidgetBannerFluid();
Widget getWidgetBannerLargeBanner();
Widget getWidgetBannerMediumRectangle();
Widget getWidgetAdsMediumRectangle();

Widget widgetRewardTextView();
Widget widgetRewardView({ bool isSaveAfter = false, required setActionFunction});

loadOnlyInterstitialAd();
loadAndShowInterstitialAd();
loadAndShowInterstitialAdQuickly();
showDialogRecompense();
showActionsDialogAds({required String title, bool isSaveAfter = false, Function? setActionFunction});

void setRewardAmount({required int action});
void setRewardAmountPlus({required int action, int amount = 0});
```

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/to/develop-plugins),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

