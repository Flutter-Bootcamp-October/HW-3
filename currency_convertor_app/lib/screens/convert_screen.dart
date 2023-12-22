import 'package:currency_convertor_app/bloc/currency_bloc.dart';
import 'package:currency_convertor_app/bloc/currency_event.dart';
import 'package:currency_convertor_app/bloc/currency_state.dart';
import 'package:currency_convertor_app/currency_model.dart';
import 'package:currency_convertor_app/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/convert_widget.dart';

class ConvertScreen extends StatelessWidget {
  ConvertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController convertController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "convert currency",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xff1b0e6a),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enter amount to convert",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                      controller: convertController,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConvertWidget(
                  textEntry: 'USD',
                  imageURL:
                      "https://cdn-icons-png.flaticon.com/512/323/323310.png",
                  action: () {
                    Currency currency = Currency(
                        id: 0,
                        currency: "USD",
                        price: double.parse(convertController.text));
                    context.read<CurrencyBloc>().add(ConvertSAREvent(currency));
                    historyList.add(currency);
                  },
                ),
                ConvertWidget(
                  textEntry: 'SAR',
                  imageURL:
                      "https://cdn-icons-png.flaticon.com/512/6211/6211558.png",
                  action: () {
                    Currency currency = Currency(
                        id: 0,
                        currency: "SAR",
                        price: double.parse(convertController.text));
                    context.read<CurrencyBloc>().add(ConvertUSDEvent(currency));
                    historyList.add(currency);
                  },
                ),
                Container(
                  width: 120,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: BlocBuilder<CurrencyBloc, CurrencyState>(
                    builder: (context, state) {
                      if (state is UpdateState) {
                        return Text("Converted currency: ${state.convert}");
                      } else {
                        if (state is ErrorState) {
                          return Text("error please enter value ");
                        } else
                          return Text("value ");
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



//  Container(
//                   width: 120,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8)),
//                   child: BlocBuilder<CurrencyBloc, CurrencyState>(
//                     builder: (context, state) {
//                       return Text("Converted currency: ");
//                     },
//                   ),
//                 ),