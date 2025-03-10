import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:brain_dev_google_ads/brain_dev_google_ads_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelBrainDevGoogleAds platform = MethodChannelBrainDevGoogleAds();
  const MethodChannel channel = MethodChannel('brain_dev_google_ads');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
