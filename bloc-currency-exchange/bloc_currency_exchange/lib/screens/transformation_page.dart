import 'package:bloc_currency_exchange/bloc/convert_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransformationPage extends StatelessWidget {
  TransformationPage({super.key});
  TextEditingController conNum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff212936),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: ListView(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                        color: const Color(0xff2946ed),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Currency',
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Converter',
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: conNum,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    hintText: 'Enter value to convert',
                    fillColor: const Color(0xffffffff)),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'From',
                          style:
                              TextStyle(color: Color(0xfff4f8f6), fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 125,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xfff4f8f6)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: DropdownButton<String>(
                                  value: context
                                      .watch<ConvertBloc>()
                                      .dropdownValue1,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  style:
                                      const TextStyle(color: Color(0xffffffff)),
                                  items: [
                                    DropdownMenuItem<String>(
                                        value: 'SR',
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/SaudiArabiaFlag.png',
                                              width: 40,
                                              height: 40,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'SR',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )
                                          ],
                                        )),
                                    DropdownMenuItem<String>(
                                        value: 'USD',
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/USDFlag.png',
                                              width: 40,
                                              height: 40,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'USD',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )
                                          ],
                                        )),
                                  ],
                                  onChanged: (String? newValue) {
                                    context.read<ConvertBloc>().add(
                                        ChangeCurrencyEvent1(
                                            currentCurrency: newValue));
                                  }),
                            )),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xff2c46eb), shape: BoxShape.circle),
                          child: const Icon(
                            Icons.arrow_right_alt,
                            size: 30,
                            color: Color(0xffffffff),
                          )),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'To',
                          style:
                              TextStyle(color: Color(0xfff4f8f6), fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 125,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xfff4f8f6)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: DropdownButton<String>(
                                  value: context
                                      .watch<ConvertBloc>()
                                      .dropdownValue2,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  style:
                                      const TextStyle(color: Color(0xffffffff)),
                                  items: [
                                    DropdownMenuItem<String>(
                                        value: 'SR',
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/SaudiArabiaFlag.png',
                                              width: 40,
                                              height: 40,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'SR',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )
                                          ],
                                        )),
                                    DropdownMenuItem<String>(
                                        value: 'USD',
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/USDFlag.png',
                                              width: 40,
                                              height: 40,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'USD',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )
                                          ],
                                        )),
                                  ],
                                  onChanged: (String? newValue) {
                                    context.read<ConvertBloc>().add(
                                        ChangeCurrencyEvent2(
                                            currentCurrency: newValue));
                                  }),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Result:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<ConvertBloc, ConvertState>(
                        builder: (context, state) {
                      if (state is ResultConvertState) {
                        return Column(
                          children: [
                            Text(
                              '${state.result}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Color(0xff2c46eb)),
                            ),
                            Text(
                              '${state.convertNum}  ${state.resultStr1} = ${state.result} ${state.resultStr2}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        );
                      } else if (state is EmptyState) {
                        return const Text('Please Enter value');
                      }
                      return Container();
                    }),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff2c46eb)),
                      ),
                      onPressed: () {
                        context.read<ConvertBloc>().add(ConvertBottonEvent(
                            currentCurrency1:
                                context.read<ConvertBloc>().dropdownValue1,
                            currentCurrency2:
                                context.read<ConvertBloc>().dropdownValue2,
                            convertNum: conNum.text));
                      },
                      child: const Text(
                        'CONVERT',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )))
            ],
          ),
        ));
  }
}
