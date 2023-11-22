import 'package:bloc_homework_tues_week_7/BLoCs/currency_bloc/currency_bloc_bloc.dart';
import 'package:bloc_homework_tues_week_7/BLoCs/currency_bloc/currency_bloc_event.dart';
import 'package:bloc_homework_tues_week_7/BLoCs/currency_bloc/currency_bloc_state.dart';
import 'package:bloc_homework_tues_week_7/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ConvertScreen extends StatelessWidget {
  ConvertScreen({super.key});

  TextEditingController toController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  bool toSar = true;
  num? total;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.attach_money_outlined),
            Text(' Convertion Process'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 64),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 50,
                  width: 100,
                  //left Textfield
                  child: TextField(
                    controller: toSar ? toController : fromController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Color(0xffD1E8E4),
                      filled: true,
                      hintText: 'From Dollar',
                      hintStyle: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    toSar = !toSar;
                  },
                  child: Icon(Icons.swap_horiz_outlined),
                ),
                BlocBuilder<CurrencyBloc, CurrencyState>(
                  builder: (context, state) {
                    if (state is ShowResultWhenTrueState) {
                      toController.text = state.result.toString();
                      return SizedBox(
                        height: 50,
                        width: 100,
                        //right Textfield
                        child: TextField(
                          controller: fromController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Color(0xffD1E8E4),
                            filled: true,
                            hintText: 'To SAR',
                            hintStyle: TextStyle(fontSize: 14),
                          ),
                        ),
                      );
                    }
                    return SizedBox(
                      height: 50,
                      width: 100,
                      //right Textfield
                      child: TextField(
                        controller: fromController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Color(0xffD1E8E4),
                          filled: true,
                          hintText: 'To SAR',
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 80,
              child: ElevatedButton(
                onPressed: () {
                  try {
                    if (toController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Enter all fields'),
                        ),
                      );
                    } else {
                      num.parse(toController.text);
                      num.parse(fromController.text);
                      Currency currency = Currency(
                          toAmount: num.parse(toController.text),
                          to: toSar,
                          fromAmount: num.parse(fromController.text));

                      context.read<CurrencyBloc>().add(
                            ProcessEvent(currency: currency),
                          );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Wrong Entery, enter numbers only'),
                      ),
                    );
                  }
                },
                child: Text('Convert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
