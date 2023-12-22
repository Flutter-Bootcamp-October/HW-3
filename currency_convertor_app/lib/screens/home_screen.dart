import 'package:currency_convertor_app/bloc/currency_bloc.dart';
import 'package:currency_convertor_app/bloc/currency_state.dart';
import 'package:currency_convertor_app/global/global.dart';
import 'package:currency_convertor_app/screens/convert_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/currency_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Currency Convertor",
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.w400),
        ),
      ),
      backgroundColor: const Color(0xff1b0e6a),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        splashColor: const Color.fromARGB(65, 13, 72, 161),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ConvertScreen();
          }));
        },
        child: const Icon(
          Icons.currency_exchange_outlined,
          color: Colors.black,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Convert History",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<CurrencyBloc, CurrencyState>(
                  builder: (context, state) {
                    return ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          if (historyList.isEmpty)
                            const Center(
                              child: Text(
                                "No history found convert to\n view your convert history",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          if (historyList.isNotEmpty)
                            for (var element in historyList)
                              CurrencyCard(
                                currency: element,
                              )

                          //                       if(historyList.isEmpty){
                          //                       return Text("data")
                          //                     }else{
                          //  for (var element in historyList)
                          //                       CurrencyCard(
                          //                         currency: element,
                          //                       )
                          //                     }
                        ]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
