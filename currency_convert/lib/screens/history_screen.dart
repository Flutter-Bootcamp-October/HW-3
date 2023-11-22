import 'package:currency_convert/bloc/converter_bloc.dart';
import 'package:currency_convert/bloc/converter_state.dart';
import 'package:currency_convert/data/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xfff7f8fa),
        appBar: AppBar(
          title: const Text("History"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: BlocBuilder<ConverterBloc, ConverterState>(
          builder: (context, state) {
            return ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(history[index]),
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
