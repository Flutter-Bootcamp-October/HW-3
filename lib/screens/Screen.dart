import 'package:currency_exchange/bloc/currency_bloc_bloc.dart';
import 'package:currency_exchange/costoms/button.dart';
import 'package:currency_exchange/costoms/text_field.dart';
import 'package:currency_exchange/model/Currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final TextEditingController amountController = TextEditingController();
  String selectedCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Currency Converter',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: BlocBuilder<CurrencyBlocBloc, CurrencyBlocState>(
        builder: (context, state) {
          String resultText = '';

          if (state is UpdateCurrency) {
            resultText =
                'Converted Amount: ${state.currency.amount?.toStringAsFixed(2)} Riyal ';
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (resultText.isNotEmpty)
                Center(
                  child: Text(
                    resultText,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              const SizedBox(height: 20),
              Center(
                child: DropdownButton<String>(
                  value: selectedCurrency,
                  items: ['USD', 'Euro'].map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      selectedCurrency = newValue;
                    }
                  },
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: LoginField(
                  controller: amountController,
                  hintText: 'Enter Your number ',
                  iconData: Icons.cloud_circle_outlined,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: LoginButton(
                  label: "Convert $selectedCurrency  TO Riyal  ",
                  onPressed: () {
                    String input = amountController.text;
                    double? amount = double.tryParse(input);
                    if (amount != null) {
                      Currency currency = Currency(
                          amount: amount,
                          fromCurrency: 'SAR',
                          toCurrency: selectedCurrency);
                      if (selectedCurrency == 'USD') {
                        context
                            .read<CurrencyBlocBloc>()
                            .add(RiyalToDollar(currency: currency));
                      } else if (selectedCurrency == 'Euro') {
                        context
                            .read<CurrencyBlocBloc>()
                            .add(RiyalToEuro(currency: currency));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a valid number'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
