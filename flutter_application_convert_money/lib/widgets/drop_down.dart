// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DropDownButtomWidget extends StatefulWidget {
  DropDownButtomWidget({super.key, required this.selectedCurrencyUnit});
 String? selectedCurrencyUnit;

  @override
  State<DropDownButtomWidget> createState() => _DropDownButtomWidgetState();
}

class _DropDownButtomWidgetState extends State<DropDownButtomWidget> {
  List<String> currencyUnit = ['USD', 'SAR'];

  //String? selectedCurrencyUnit = 'USD';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 100,
      child: DropdownButtonFormField<String?>(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                      width: 2, color: Color.fromARGB(170, 101, 180, 150))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                      width: 2, color: Color.fromARGB(170, 101, 180, 150)))),
          value: widget.selectedCurrencyUnit,
          items: currencyUnit
              .map(
                (element) => DropdownMenuItem<String>(
                    value: element, child: Text(element)),
              )
              .toList(),
          onChanged: (value) =>
              setState(() => widget.selectedCurrencyUnit = value!)),
    );
  }
}
