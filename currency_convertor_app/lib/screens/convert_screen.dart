import 'package:currency_convertor_app/bloc/currency_bloc.dart';
import 'package:currency_convertor_app/bloc/currency_event.dart';
import 'package:currency_convertor_app/bloc/currency_state.dart';
import 'package:currency_convertor_app/currency_model.dart';
import 'package:currency_convertor_app/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/convert_widget.dart';

class ConvertScreen extends StatelessWidget {
  const ConvertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fromController = TextEditingController(),
        toController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xff1b0e6a),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Convert Currency"),
              ConvertWidget(
                textEntry: 'USD',
                imageURL:
                    "https://cdn-icons-png.flaticon.com/512/323/323310.png",
                action: () {
                  final Currency currency = Currency(
                      id: 0,
                      currency: "USD",
                      price: double.parse(fromController.text));
                  context.read<CurrencyBloc>().add(ConvertSAREvent(currency));
                  historyList.add(currency);
                },
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<CurrencyBloc, CurrencyState>(
                builder: (BuildContext context, state) {
                  return Container(
                    color: Colors.white,
                    height: 45,
                    child: TextField(
                      controller: fromController,
                      decoration: InputDecoration(
                        label: Text("to ${state.convert}"),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          ConvertWidget(
            textEntry: 'SAR',
            imageURL: "https://cdn-icons-png.flaticon.com/512/323/323310.png",
            action: () {
              final Currency currency = Currency(
                  id: 0,
                  currency: "SAR",
                  price: double.parse(fromController.text));
              context.read<CurrencyBloc>().add(ConvertUSDEvent(currency));
              historyList.add(currency);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<CurrencyBloc, CurrencyState>(
            builder: (BuildContext context, state) {
              return Container(
                color: Colors.white,
                height: 45,
                child: TextField(
                  controller: toController,
                  decoration: InputDecoration(
                    label: Text("to ${state.convert}"),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
