import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_page_controller.dart';

class LoginPage extends GetView<LoginPageController> {

  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
