// home_screen.dart
import 'package:currencychangerr/bloc/currency_bloc.dart';
import 'package:currencychangerr/bloc/currency_event.dart';
import 'package:currencychangerr/bloc/currency_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Enter Amount in USD',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Convert to SAR'),
              onPressed: () {
                context.read<CurrencyBloc>().add(
                      CurrencyEvent(amountController.text),
                    );
              },
            ),
            SizedBox(height: 20),
            BlocBuilder<CurrencyBloc, CurrencyState>(
              builder: (context, state) {
                if (state is InitialStatee) {
                  return Text(
                    "",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else if (state is totalcurrencyState) {
                  return Text(
                    "total ${state.total} SAR",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
