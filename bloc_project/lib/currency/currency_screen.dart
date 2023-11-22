import 'package:bloc_project/bloc/currecny_bloc/currency_bloc.dart';
import 'package:bloc_project/currency/history_screen.dart';
import 'package:bloc_project/models/convert_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    String from = "SAR", to = "USD";
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoryScreen(),
                    ));
              },
              icon: const Icon(Icons.history)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Currency Converter",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter Amount",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: TextField(
                controller: amountController,
                decoration: const InputDecoration(
                    hintText: "Amount",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text("From"),
                  CustomDropDownBox(
                      selectedVal: from, func: (val) => from = val)
                ],
              ),
              Column(
                children: [
                  const Text("To"),
                  CustomDropDownBox(selectedVal: to, func: (val) => to = val)
                ],
              ),
            ],
          ),
          BlocBuilder<CurrencyBloc, CurrencyState>(
            builder: (context, state) {
              if (state is ConvertFromSarToUsdState) {
                return Text(
                    "${amountController.text} SAR = ${state.amount} USD");
              } else if (state is ConvertFromUSDToSarState) {
                return Text(
                    "${amountController.text} USD = ${state.amount} SAR");
              } else if (state is ErrState) {
                return const Text("Error, fill the field with a number");
              } else {
                return const Text("waiting");
              }
            },
          ),
          BlocBuilder<CurrencyBloc, CurrencyState>(
            builder: (context, state) {
              return ElevatedButton(
                  onPressed: () {
                    if (from == "SAR" && to == "USD") {
                      ConvertModel model = ConvertModel(
                        fromAmount: double.tryParse(amountController.text),
                        toAmount: double.tryParse(amountController.text),
                        from: from,
                        to: to,
                      );
                      context
                          .read<CurrencyBloc>()
                          .add(ConvertFromSarToUsdEvent(convert: model));
                    } else if (from == "USD" && to == "SAR") {
                      ConvertModel model = ConvertModel(
                        fromAmount: double.tryParse(amountController.text),
                        toAmount: double.tryParse(amountController.text),
                        from: from,
                        to: to,
                      );
                      context
                          .read<CurrencyBloc>()
                          .add(ConvertFromUSDToSarEvent(convert: model));
                    }
                  },
                  child: const Text("Convert"));
            },
          ),
        ],
      ),
    );
  }
}

class CustomDropDownBox extends StatefulWidget {
  const CustomDropDownBox(
      {Key? key, required this.func, required this.selectedVal})
      : super(key: key);

  @override
  State<CustomDropDownBox> createState() => _CustomDropDownBoxState();
  final String Function(String) func;
  final String selectedVal;
}

class _CustomDropDownBoxState extends State<CustomDropDownBox> {
  List<String> list = ["SAR", "USD"];
  String selectedVal = "";

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: selectedVal == "" ? widget.selectedVal : selectedVal,
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          selectedVal = value!;

          widget.func(selectedVal);
          setState(() {});
        });
  }
}
