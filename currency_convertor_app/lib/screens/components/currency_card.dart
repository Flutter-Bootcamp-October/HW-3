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
          child: Center(
            child: Text(
              "${currency.price} ${currency.currency}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }
}
