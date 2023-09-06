import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/historic_page_controller.dart';
import 'components/historic_card.dart';

class HistoricPage extends GetView<HistoricPageController> {
  const HistoricPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.cyan[300],
              onPressed: () {
                Get.defaultDialog(
                  title: 'Adicionar Assistente',
                  content: TextFormField(
                    controller: controller.assistantController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Meu Chat é um ...',
                    ),
                  ),
                  textConfirm: 'Adicionar',
                  textCancel: 'Cancelar',
                  confirmTextColor: Colors.orange,
                  onConfirm: () {
                    controller.assistantsList.add(controller.assistantController.text);
                    controller.goToNextPage();
                    controller.assistantController.clear();
                  },
                  onCancel: () {
                    Get.back();
                  },
                );
              },
              child: const Icon(Icons.messenger)),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 10,
                ),
                child: const Text(
                  'Conversas',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(2, (index) => const HistoricCard()),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
