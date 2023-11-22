import 'package:currency_convert/bloc/converter_bloc.dart';
import 'package:currency_convert/bloc/converter_state.dart';
import 'package:currency_convert/data/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.enabled,
    required this.controller,
  });
  final bool enabled;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    List currencies = ["USD", "SAR"];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.75),
              blurRadius: 3,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                enabled
                    ? "Select your currency type"
                    : "Select converted curency type",
                style: const TextStyle(color: Color(0xff676a73)),
              ),
              DropdownMenu(
                  onSelected: (value) {
                    enabled
                        ? currentType = currencies[value!]
                        : convertedType = currencies[value!];
                  },
                  inputDecorationTheme: const InputDecorationTheme(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(style: BorderStyle.none)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(style: BorderStyle.none)),
                    filled: true,
                    fillColor: Color(0xffedf0f9),
                  ),
                  expandedInsets: const EdgeInsets.all(0),
                  menuStyle: const MenuStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xffedf0f9))),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 0, label: "USD"),
                    DropdownMenuEntry(value: 1, label: "SAR"),
                  ]),
              Text(
                enabled ? "Enter your currency" : "your converted currency",
                style: const TextStyle(color: Color(0xff676a73)),
              ),
              BlocBuilder<ConverterBloc, ConverterState>(
                builder: (context, state) {
                  return TextField(
                    controller: controller,
                    keyboardType:
                        enabled ? TextInputType.number : TextInputType.none,
                    showCursor: enabled ? true : false,
                    decoration: InputDecoration(
                      hintText: enabled ? "" : state.result,
                      prefixIcon: const Icon(
                        Icons.currency_exchange_rounded,
                        color: Colors.green,
                      ),
                      filled: true,
                      fillColor: const Color(0xffedf0f9),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          borderSide: BorderSide(style: BorderStyle.none)),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          borderSide: BorderSide(style: BorderStyle.none)),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
