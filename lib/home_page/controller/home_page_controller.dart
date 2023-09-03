import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';

class HomePageController extends GetxController {
  goToNextPage(){
    Get.toNamed(
        AppRoutes.HISTORIC,
      );
  }
}
