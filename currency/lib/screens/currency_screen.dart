import 'package:currency/bloc/currency_bloc.dart';
import 'package:currency/bloc/currency_event.dart';
import 'package:currency/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyScreen extends StatefulWidget {
  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final TextEditingController amountController = TextEditingController();

  String selectedCurrency = 'rupees';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 81, 15, 11),
        centerTitle: true,
        title: const Text('Currency Converter',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800)),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  labelText: 'Enter amount in dollars',
                  labelStyle:
                      const TextStyle(color: Color.fromARGB(255, 81, 15, 11)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                value: selectedCurrency,
                borderRadius: BorderRadius.circular(20),
                onChanged: (Value) {
                  setState(() {
                    selectedCurrency = Value!;
                  });
                },
                items: ['rupees', 'euros', 'RS'].map<DropdownMenuItem>((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                          fontSize: 18, color: Color.fromARGB(255, 81, 15, 11)),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 81, 15, 11))),
              onPressed: () {
                if (amountController.text.isNotEmpty) {
                  conversionResultEvent result = conversionResultEvent(
                    amount: double.parse(amountController.text),
                    convertedAmount: double.parse(amountController.text),
                    targetCurrency: selectedCurrency,
                  );
                  context.read<currencyBloc>().add(addCurrencyEvent(result));
                  context
                      .read<currencyBloc>()
                      .add(convertCurrencyEvent(result));
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Convert',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
