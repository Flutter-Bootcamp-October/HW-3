import 'package:flutter/material.dart';
import 'package:hw_bloc/model/history.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key, required this.history});
  final History history;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70,
        child: Card(
          shape: const RoundedRectangleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('From: ${history.from} '),
                    Text(history.price.toString())
                  ],
                ),
                Row(
                  children: [
                    Text('to: ${history.to} '),
                    Text(history.result.toString())
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
