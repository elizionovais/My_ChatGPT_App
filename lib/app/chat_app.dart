import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatApp extends StatelessWidget {
  final String titulo;
  final List<GetPage<dynamic>>? routes;
  final String? initialRoute;
  final Bindings? initialBinding;
  const ChatApp({
    Key? key,
    required this.titulo,
    required this.routes,
    required this.initialRoute,
    this.initialBinding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: titulo,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: routes,
      initialRoute: initialRoute,
      initialBinding: initialBinding,
    );
  }
}
