import 'package:currency_convertor_app/screens/components/convert_widget.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1b0e6a),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  ConvertWidget(
                    textEntry: "USD",
                    imageURL:
                        "https://cdn-icons-png.flaticon.com/512/323/323310.png",
                    action: () {},
                    resultText: 'From',
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    height: 45,
                    width: 95,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                          decoration: InputDecoration(hintText: "From")),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ConvertWidget(
                    textEntry: "SAR",
                    imageURL:
                        "https://cdn-icons-png.flaticon.com/512/6211/6211558.png",
                    action: () {},
                    resultText: 'To',
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    height: 45,
                    width: 95,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                          decoration: InputDecoration(hintText: "To")),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ConvertWidget extends StatelessWidget {
  const ConvertWidget({
    super.key,
    required this.textEntry,
    required this.imageURL,
    required this.action,
    required this.resultText,
  });

  final String textEntry;
  final String imageURL;
  final Function() action;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: action,
          child: Container(
            height: 85,
            width: 95,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                ClipRRect(
                  child: Image.network(
                    imageURL,
                    scale: 10,
                  ),
                ),
                Text(textEntry),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        // Container(

        //   decoration: BoxDecoration(
        //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
        //   alignment: Alignment.center,
        //   height: 45,
        //   width: 95,
        //   child: Padding(
        //     padding: const EdgeInsets.all(12.0),
        //     child: TextField(decoration: InputDecoration(hintText: resultText)),
        //   ),
        // ),
      ],
    );
  }
}
