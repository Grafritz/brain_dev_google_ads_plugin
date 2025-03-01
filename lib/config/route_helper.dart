// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteHelper {

  static const String redirectVar = 'redirect';
  static const String routeLoginPage = '/login';

  static getRouteLoginPage({String? redirect}) =>
      '$routeLoginPage${(redirect == null) ? '' : '?$redirectVar=$redirect'}';

  static navLoginPageReplacement({String? redirect}) =>
      Navigator.pushReplacementNamed(
          Get.context!, getRouteLoginPage(redirect: redirect));

  //region [ NAVIGATOR PAGES ]
  static navToPage(String? redirect) {
    if (redirect != null && redirect.isNotEmpty) {
      Get.toNamed(redirect);
    } else {
      Get.back();
    }
  }

  static navToReplacementPage(String redirect) {
    if (redirect.isNotEmpty) {
      Navigator.pushReplacementNamed(
          Get.context!, redirect);
    }
  }
  //endregion


  // static navigateToInformationScreen(String title, {widgetBannerBottomNavigation}) {
  //   Navigator.push(
  //     Get.context!,
  //     MaterialPageRoute(
  //         builder: (context) => InformationScreen(information: title, widgetBannerBottomNavigation: widgetBannerBottomNavigation)),
  //   );
  // }

}