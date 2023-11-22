import 'package:currency_convert/bloc/converter_bloc.dart';
import 'package:currency_convert/bloc/converter_event.dart';
import 'package:currency_convert/data/globals.dart';
import 'package:currency_convert/screens/history_screen.dart';
import 'package:currency_convert/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController selectedCurrency = TextEditingController(),
        convertedCurrency = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xfff7f8fa),
      appBar: AppBar(
        title: const Text("Currency Converter"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              AppContainer(
                enabled: true,
                controller: selectedCurrency,
              ),
              InkWell(
                onTap: () {
                  context.read<ConverterBloc>().add(ConvertEvent(
                      currentCurrencyType: currentType,
                      convertedCurrency: convertedType,
                      value: double.parse(selectedCurrency.text)));
                },
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.75),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.currency_exchange_rounded,
                    color: Colors.green,
                    size: 50,
                  ),
                ),
              ),
              AppContainer(
                enabled: false,
                controller: convertedCurrency,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffedf0f9),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HistoryScreen()));
        },
        child: const Icon(Icons.history),
      ),
    );
  }
}
