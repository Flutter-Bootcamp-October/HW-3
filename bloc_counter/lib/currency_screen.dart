import 'package:bloc_counter/bloc/currency_bloc/currency_bloc.dart';
import 'package:bloc_counter/bloc/currency_bloc/currency_event.dart';
import 'package:bloc_counter/bloc/currency_bloc/currency_state.dart';
import 'package:bloc_counter/conversion_history.dart';
import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController c1 = TextEditingController();
    String displayText = "";
    String flag1 = "";
    String curr1 = "";
    String flag2 = "";
    String curr2 = "";
    return Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConversionHistory()),
                    );
                  },
                  icon: const Icon(Icons.history))
            ],
            backgroundColor: Colors.blue,
            title: const Text("Currency Convetrer")),
        body:
            BlocBuilder<CurrencyBloc, CurrencyState>(builder: (context, state) {
          if (state is InintialCurrencyState) {
            displayText = state.amount;
            flag1 = state.flag1;
            curr1 = state.curr1;
            flag2 = state.flag2;
            curr2 = state.curr2;
          } else if (state is ErrorSttae) {
            displayText = state.message;
          } else if (state is ConversionState) {
            displayText = "${state.returendAmount} $curr2";
          } else if (state is SwitchState) {
            flag1 = state.flag1;
            curr1 = state.curr1;
            flag2 = state.flag2;
            curr2 = state.curr2;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Enter Amount to Convert:",
                  style: TextStyle(fontSize: 20)),
              TextField(
                  onSubmitted: (value) {
                    context.read<CurrencyBloc>().add(ConvertEvent(
                        c1.text.trim(),
                        flag1: flag1,
                        curr1: curr1,
                        flag2: flag2,
                        curr2: curr2));
                  },
                  controller: c1,
                  decoration: const InputDecoration(
                      filled: true,
                      labelStyle: TextStyle(fontSize: 20),
                      label: Text("Amount"),
                      hintText: "enter amount")),
              FittedBox(
                  child: Row(children: [
                SizedBox(
                  width: 200,
                  height: 100,
                  child: ListTile(
                      leading: CountryFlag.fromCountryCode(
                        flag1,
                        height: 48,
                        width: 48,
                        borderRadius: 8,
                      ),
                      title: Text(curr1)),
                ),
                IconButton(
                    tooltip: "switch",
                    style: const ButtonStyle(
                        foregroundColor:
                            MaterialStatePropertyAll<Color>(Colors.white),
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.blue)),
                    onPressed: () {
                      context.read<CurrencyBloc>().add(SwitchEvent(
                          flag1: flag1,
                          curr1: curr1,
                          flag2: flag2,
                          curr2: curr2));
                    },
                    icon: const Icon(Icons.compare_arrows, size: 50)),
                const SizedBox(width: 50),
                SizedBox(
                  width: 200,
                  height: 100,
                  child: ListTile(
                      leading: CountryFlag.fromCountryCode(
                        flag2,
                        height: 48,
                        width: 48,
                        borderRadius: 8,
                      ),
                      title: Text(curr2)),
                )
              ])),
              Text(displayText, style: const TextStyle(fontSize: 20)),
            ]),
          );
        }));
  }
}
