import 'package:currency/bloc/currency_bloc.dart';
import 'package:currency/bloc/currency_event.dart';
import 'package:currency/bloc/currency_state.dart';
import 'package:currency/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    super.key,
    required this.result,
  });

  final conversionResultEvent result;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black,
              blurRadius: 0.1,
              spreadRadius: 0.1,
              blurStyle: BlurStyle.normal)
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          const Text(
                            'amount: ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 81, 15, 11)),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            '${result.amount}',
                            style: const TextStyle(
                                color: const Color.fromARGB(255, 81, 15, 11),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<currencyBloc, currencyState>(
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              const Text(
                                'converted amount: ',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 81, 15, 11)),
                              ),
                              Text(" ${result.convertedAmount}",
                                  style: const TextStyle(
                                      color:
                                          const Color.fromARGB(255, 81, 15, 11),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: InkWell(
                child: const Icon(
                  Icons.delete_outline_outlined,
                  color: const Color.fromARGB(255, 81, 15, 11),
                ),
                onTap: () {
                  context.read<currencyBloc>().add(deleteCurrencyEvent(result));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
