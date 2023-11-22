import 'package:bloc_currency_exchange/model/convert_model.dart';
import 'package:flutter/material.dart';

class TransformationCard extends StatelessWidget {
  TransformationCard({super.key, required this.history});

  ConvertHistoryModel history;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.all(8),
            elevation: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      //overflow: TextOverflow.ellipsis,
                      '${history.v1}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "${history.c1}=",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "${history.v2}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "${history.c2}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            )));
  }
}
