import 'package:currency/bloc/currency_bloc.dart';
import 'package:currency/bloc/currency_state.dart';
import 'package:currency/models/currency_model.dart';
import 'package:currency/screens/currency_screen.dart';
import 'package:currency/widgets/currency_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu_open_sharp,
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 81, 15, 11),
        title: const Text(
          'Converter',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 81, 15, 11),
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 600,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: BlocBuilder<currencyBloc, currencyState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (var element in results) CurrencyCard(result: element)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 145),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: const Color.fromARGB(255, 81, 15, 11),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CurrencyScreen()),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
