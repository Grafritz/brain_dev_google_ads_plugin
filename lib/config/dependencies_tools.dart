
import 'package:brain_dev_business/services/sender_google_ads_service.dart';
import 'package:brain_dev_google_ads/controllers/admob_controller.dart';
import 'package:brain_dev_google_ads/impl_services/sender_google_ads_service_impl.dart';
import 'package:get/get.dart';

/*Future<Map<String, Map<String, String>>>*/
initBrainDevGoogleAdsDependencies()
{
  //region Controller
  Get.lazyPut<SenderGoogleAdsService>(() => SenderGoogleAdsServiceImpl(), fenix: true);
  Get.lazyPut(() => AdmobController(sharedPreferences: Get.find()), fenix: true);
  //endregion
}
