import 'package:currency_convertor_app/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    super.key,
    required this.currency,
  });

  final Currency currency;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 75,
        child: Card(
          color: Colors.white,
          shape: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        child: Image.network(
                          "https://cdn-icons-png.flaticon.com/512/323/323310.png",
                          height: 35,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          Text("From"),
                          Text("curency ${currency.price}"),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text("To"),
                          Text("curency ${currency.price}"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
