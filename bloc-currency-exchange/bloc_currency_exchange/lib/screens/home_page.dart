import 'package:bloc_currency_exchange/bloc/convert_bloc.dart';
import 'package:bloc_currency_exchange/data/global_data.dart';
import 'package:bloc_currency_exchange/screens/transformation_page.dart';
import 'package:bloc_currency_exchange/widgets/transformation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: BlocBuilder<ConvertBloc, ConvertState>(
          builder: (context, state) {
            return ListView(
              children: [
                for (var element in listConver)
                  TransformationCard(history: element),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransformationPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
