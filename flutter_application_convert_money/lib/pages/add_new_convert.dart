import 'package:flutter/material.dart';
import 'package:flutter_application_convert_money/bloc/convert_bloc.dart';
import 'package:flutter_application_convert_money/bloc/convert_event.dart';
import 'package:flutter_application_convert_money/model/convert_model.dart';
import 'package:flutter_application_convert_money/widgets/drop_down.dart';
import 'package:flutter_application_convert_money/widgets/text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewConvert extends StatelessWidget {
  AddNewConvert({
    super.key,
    this.currencyConvert,
  });

  final CurrencyConvert? currencyConvert;

  final TextEditingController amountController = TextEditingController();
  final String? selectedCurrencyUnitFrom = "USD";
  final String? selectedCurrencyUnitTo = "SAR";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Currency Converter"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(170, 101, 180, 150),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Amount :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              labelText: 'amount',
              controller: amountController,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      "From :",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropDownButtomWidget(
                        selectedCurrencyUnit: selectedCurrencyUnitFrom)
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "To :",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropDownButtomWidget(
                      selectedCurrencyUnit: selectedCurrencyUnitTo,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: InkWell(
                onTap: () {
                  final CurrencyConvert currencyConvert = CurrencyConvert(
                    amount: double.parse(amountController.text),
                    currencyFrom: selectedCurrencyUnitFrom,
                    currencyTo: selectedCurrencyUnitTo,
                  );
                  context
                      .read<ConvertBloc>()
                      .add(AddConvertEvent(currencyConvert));
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(170, 101, 180, 150),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      "Convert",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
