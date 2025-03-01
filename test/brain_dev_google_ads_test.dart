import 'package:flutter_test/flutter_test.dart';
import 'package:brain_dev_google_ads/brain_dev_google_ads.dart';
import 'package:brain_dev_google_ads/brain_dev_google_ads_platform_interface.dart';
import 'package:brain_dev_google_ads/brain_dev_google_ads_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBrainDevGoogleAdsPlatform
    with MockPlatformInterfaceMixin
    implements BrainDevGoogleAdsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BrainDevGoogleAdsPlatform initialPlatform = BrainDevGoogleAdsPlatform.instance;

  test('$MethodChannelBrainDevGoogleAds is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBrainDevGoogleAds>());
  });

  test('getPlatformVersion', () async {
    BrainDevGoogleAds brainDevGoogleAdsPlugin = BrainDevGoogleAds();
    MockBrainDevGoogleAdsPlatform fakePlatform = MockBrainDevGoogleAdsPlatform();
    BrainDevGoogleAdsPlatform.instance = fakePlatform;

    expect(await brainDevGoogleAdsPlugin.getPlatformVersion(), '42');
  });
}
