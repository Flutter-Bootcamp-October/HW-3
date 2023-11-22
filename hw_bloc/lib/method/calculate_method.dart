import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_bloc/blocs/bloc/convert_bloc.dart';

List<String> list = <String>['SAR', 'USD'];

class CalculateMethod {
  final convertController = TextEditingController();
  String dropdownValue = list.first;
  String dropValue = list.last;
  Future<void> calculate({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: convertController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('From'),
              Text('To'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownMenu<String>(
                width: 100,
                inputDecorationTheme: InputDecorationTheme(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                initialSelection: list.first,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  dropdownValue = value!;
                },
                dropdownMenuEntries:
                    list.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry(value: value, label: value);
                }).toList(),
              ),
              DropdownMenu<String>(
                width: 100,
                inputDecorationTheme: InputDecorationTheme(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                initialSelection: list.last,
                onSelected: (String? value) {
                  dropValue = value!;
                },
                dropdownMenuEntries:
                    list.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry(value: value, label: value);
                }).toList(),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<ConvertBloc, ConvertState>(builder: (context, state) {
            if (state is ConvertResult) {
              return Text(state.result);
            } else if (state is ErrorState) {
              return Text(state.error);
            } else {
              return const Text(" ");
            }
          }),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<ConvertBloc>().add(AddEvent(
                    dropdownValue, dropValue,
                    price: convertController.text));
              },
              child: const Text('Convert'))
        ],
      )),
    );
  }
}
