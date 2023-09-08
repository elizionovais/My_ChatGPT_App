import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/historic_page_controller.dart';
import 'components/historic_card.dart';
import 'components/historic_card_shimmer.dart';

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
                    controller.saveChat();
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
                    Obx(() {
                      if (controller.isLoading.value) {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: List.generate(
                              5,
                              (index) => const HistoricCardShimmer(height: 90),
                            ));
                      }
                      if (controller.chats.isEmpty) {
                        return const Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 20),
                            Center(
                              child: Text(
                                ':( Você ainda não tem conversas salvas',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(
                            controller.chats.length,
                            (index) => HistoricCard(
                                  chatEntity: controller.chats[index],
                                  onTap: () {
                                    controller.goToNextPage(controller.chats[index]);
                                  },
                                  onDelete: () {
                                    controller.deleteChat(controller.chats[index]);
                                  },
                                )),
                      );
                    }),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
