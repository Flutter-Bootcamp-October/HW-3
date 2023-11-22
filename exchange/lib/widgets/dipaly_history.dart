import 'package:currency_converter/currency.dart';
import 'package:exchange/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class DispalyExchange extends StatelessWidget {
  const DispalyExchange({
    super.key,
    required this.exchange,
  });

  final Exchage exchange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment(0.00, 1.00),
                end: Alignment(0, -1),
                colors: [
                  Color(0xFFC0BFE7),
                  Color.fromARGB(255, 127, 127, 180),
                  Color(0xFF8989BA)
                ],
              ),
            ),
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Amount: ${exchange.amount.toString()}",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    "Result: ${exchange.result.toString()}",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      exchange.from == Currency.usd
                          ? Flag(Flags.united_states_of_america)
                          : Flag(Flags.saudi_arabia),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(Icons.arrow_forward_rounded),
                      const SizedBox(
                        width: 8,
                      ),
                      exchange.to == Currency.usd
                          ? Flag(Flags.united_states_of_america)
                          : Flag(Flags.saudi_arabia),
                    ],
                  ),
                  // Text(
                  //   "From: ${exchange.from.toString()}",
                  //   style: const TextStyle(fontSize: 16, color: Colors.white),
                  // ),
                  // Text(
                  //   "To: ${exchange.to.toString()}",
                  //   style: const TextStyle(fontSize: 16, color: Colors.white),
                  // ),
                ],
              ),
            )));
  }
}
