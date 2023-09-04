import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/historic_page_controller.dart';
import 'components/assistant_widget.dart';
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
                controller.goToNextPage();
              },
              child: const Icon(Icons.messenger)),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Row(children: [
                        AssistantWidget(),
                        AssistantWidget(
                          addWidget: true,
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
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
                      children: List.generate(1, (index) => const HistoricCard()),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
