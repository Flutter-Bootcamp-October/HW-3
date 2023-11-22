import 'package:currency_converter/currency.dart';
import 'package:exchange/bloc/currency_bloc.dart';
import 'package:exchange/models/currency.dart';
import 'package:exchange/screens/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

List<Exchage> exchangeList = [];
Currency from = Currency.sar;
Currency to = Currency.usd;

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    return Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
        appBar: AppBar(
          title: const Text("Currency Exchange"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryScreen()));
                },
                icon: const Icon(Icons.history))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 23.0, top: 150),
          child: Container(
            width: 350,
            height: 350,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x0C000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Amount',
                    style: TextStyle(
                      color: Color(0xFF979797),
                    ),
                  ),
                  BlocBuilder<CurrencyBloc, CurrencyState>(
                    builder: (context, state) {
                      if (state is changeCurrncyState) {
                        from = state.from;
                        to = state.to;
                        return Column(
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  from == Currency.usd
                                      ? Flag(Flags.united_states_of_america)
                                      : Flag(Flags.saudi_arabia),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(Icons.arrow_forward_rounded),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  to == Currency.usd
                                      ? Flag(Flags.united_states_of_america)
                                      : Flag(Flags.saudi_arabia),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      return Column(
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                from == Currency.usd
                                    ? Flag(Flags.united_states_of_america)
                                    : Flag(Flags.saudi_arabia),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Icon(Icons.arrow_forward_rounded),
                                const SizedBox(
                                  width: 8,
                                ),
                                to == Currency.usd
                                    ? Flag(Flags.united_states_of_america)
                                    : Flag(Flags.saudi_arabia),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8, bottom: 6),
                    width: 200,
                    height: 45,
                    decoration: ShapeDecoration(
                      color: const Color.fromARGB(74, 127, 95, 152),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: TextField(
                        controller: amountController,
                        decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Exchage exchange = Exchage(
                          amount: amountController.text,
                          to: to,
                          from: from,
                          result: 0);
                      context
                          .read<CurrencyBloc>()
                          .add(UpdateNumberEvent(exchange));
                    },
                    child: const Text('Calculate'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<CurrencyBloc>()
                          .add(changeCurrencyEvent(from, to));
                    },
                    child: const Icon(Icons.currency_exchange),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color.fromARGB(74, 127, 95, 152),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 8, bottom: 6),
                      width: 200,
                      height: 45,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFEEEEEE),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: BlocBuilder<CurrencyBloc, CurrencyState>(
                        builder: (context, state) {
                          if (state is ResultState) {
                            return Center(
                                child: Text("Result : ${state.result}"));
                          } else if (state is ErrorState) {
                            return Center(child: Text(state.error));
                          }
                          return const Center(child: Text("Result :"));
                        },
                      )),
                ]),
          ),
        ));
  }
}
