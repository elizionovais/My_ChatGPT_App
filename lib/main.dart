import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_gpt/app/chat_app.dart';
import 'package:my_chat_gpt/home_page/binding/home_page_binding.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/data/firebase/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChatApp(
    titulo: "FastSPDA",
    routes: AppPages.routes,
    initialRoute: AppRoutes.HOME,
    initialBinding: HomePageBinding(),
  ));
}
