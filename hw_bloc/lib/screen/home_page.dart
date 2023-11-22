import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_bloc/blocs/bloc/convert_bloc.dart';
import 'package:hw_bloc/method/calculate_method.dart';
import 'package:hw_bloc/model/history.dart';
import 'package:hw_bloc/widget/history_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black38,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CalculateMethod().calculate(context: context);
        },
        child: const Icon(Icons.calculate),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ConvertBloc, ConvertState>(
              builder: (context, state) {
                return ListView(
                  shrinkWrap: true,
                  children: [
                    for (var e in listHistory) HistoryWidget(history: e)
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
