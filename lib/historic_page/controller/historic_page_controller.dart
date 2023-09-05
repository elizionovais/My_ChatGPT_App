import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';

class HistoricPageController extends GetxController {

  final RxList<String> assistantsList = [
    'Assistente Util',
    'Engenheiro de Software',
  ].obs;

  goToNextPage(){
    Get.toNamed(
        AppRoutes.CHAT,
      );
  }

}
