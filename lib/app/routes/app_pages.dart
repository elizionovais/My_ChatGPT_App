import 'package:get/get.dart';
import 'package:my_chat_gpt/chat_page/ui/chat_page.dart';
import 'package:my_chat_gpt/home_page/binding/home_page_binding.dart';
import 'package:my_chat_gpt/home_page/ui/home_page.dart';

import '../../chat_page/binding/chat_page_binding.dart';
import '../../historic_page/binding/historic_page_binding.dart';
import '../../historic_page/ui/historic_page.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: AppRoutes.CHAT,
      page: () => const ChatPage(),
      binding: ChatPageBinding(),
    ),
    GetPage(
      name: AppRoutes.HISTORIC,
      page: () => const HistoricPage(),
      binding: HistoricPageBinding(),
    ),
  ];
}
