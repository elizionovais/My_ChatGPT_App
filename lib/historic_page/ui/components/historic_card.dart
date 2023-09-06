import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoricCard extends StatelessWidget {
  const HistoricCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border.fromBorderSide(
            BorderSide(
              color: Colors.black12,
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.width * 0.7,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assistente Util',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Last message: Olá, tudo bem?',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '20/10/2021 10:00',
                    style: TextStyle(fontSize: 15, color: Colors.orange),
                  ),
                ],
              ),
            ),
            const Icon(Icons.delete, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
