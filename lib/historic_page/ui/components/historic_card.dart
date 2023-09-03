import 'package:flutter/material.dart';

class HistoricCard extends StatelessWidget {
  const HistoricCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border.fromBorderSide(
            BorderSide(
              color: Colors.black12,
              width: 1,
            ),
          ),
        ),
        child: const ListTile(
          title:
              Text('Last question: Como posso te ajudar?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          subtitle: Text('28/08/2021 15:00', style: TextStyle(fontSize: 14, color: Colors.orange)),
          trailing: Icon(Icons.delete, color: Colors.red),
        ),
      ),
    );
  }
}
