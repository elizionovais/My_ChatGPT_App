import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';

class HistoricPageController extends GetxController {

  goToNextPage(){
    Get.toNamed(
        AppRoutes.CHAT,
      );
  }

}
