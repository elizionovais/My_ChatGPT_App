import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';

class HistoricPageController extends GetxController {
  final TextEditingController assistantController = TextEditingController();
  final RxList<String> assistantsList = [
    'Assistente Util',
    'Engenheiro de Software',
  ].obs;

  goToNextPage() async {
    Get.toNamed(
      AppRoutes.CHAT,
    );
  }

}
