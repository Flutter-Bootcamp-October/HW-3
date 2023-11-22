import 'package:flutter/material.dart';
import 'package:flutter_application_convert_money/bloc/convert_bloc.dart';
import 'package:flutter_application_convert_money/bloc/convert_state.dart';
import 'package:flutter_application_convert_money/data/gloabls.dart';
import 'package:flutter_application_convert_money/pages/add_new_convert.dart';
import 'package:flutter_application_convert_money/widgets/converts_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfConverts extends StatelessWidget {
  const ListOfConverts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Currency Converter"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(170, 101, 180, 150),
      ),
      body: SafeArea(
        child: BlocBuilder<ConvertBloc, ConvertState>(
          builder: (context, state) {
            return ListView(
              shrinkWrap: true,
              children: [
                for (var element in listCurrencyConvertsData)
                  ConvertsCard(
                    currencyConvert: element,
                  )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color.fromARGB(170, 101, 180, 150),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddNewConvert();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
