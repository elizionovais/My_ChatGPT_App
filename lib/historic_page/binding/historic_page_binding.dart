import 'package:get/get.dart';

import '../controller/historic_page_controller.dart';

class HistoricPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoricPageController>(() => HistoricPageController());
  }
}