import 'package:flutter/material.dart';
import 'package:flutter_application_convert_money/model/convert_model.dart';

class ConvertsCard extends StatelessWidget {
  const ConvertsCard({super.key, required this.currencyConvert});

  final CurrencyConvert currencyConvert;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(8),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (currencyConvert.currencyFromUnit == "USD")
                    SizedBox(
                        height: 30,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/amirica.png",
                          ),
                        )),
                  if (currencyConvert.currencyFromUnit == "SAR")
                    SizedBox(
                        height: 30,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/saudia.png",
                          ),
                        )),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${currencyConvert.amount!.toStringAsFixed(2)} ${currencyConvert.currencyFromUnit} = ',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${currencyConvert.resultConvert!.toStringAsFixed(2)}  ${currencyConvert.currencyTo}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
