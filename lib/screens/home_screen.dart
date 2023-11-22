import 'package:bloc_homework_tues_week_7/BLoCs/currency_bloc/currency_bloc_bloc.dart';
import 'package:bloc_homework_tues_week_7/BLoCs/currency_bloc/currency_bloc_state.dart';
import 'package:bloc_homework_tues_week_7/data/currency_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.history),
            Text(' Convertion History'),
          ],
        ),
      ),
      body: BlocBuilder<CurrencyBloc, CurrencyState>(builder: (context, state) {
        if (state is InitState) {
          return ListView.builder(
            itemCount: currencyData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                  height: 70,
                  child: Card(
                    color: Colors.blue[600],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${currencyData[index]['toAmount'].toString()} USD',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.swap_horizontal_circle_sharp,
                          size: 32,
                        ),
                        Text(
                          '${currencyData[index]['fromAmount'].toString()} SAR',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
