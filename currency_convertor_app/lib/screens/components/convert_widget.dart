import 'package:flutter/material.dart';

class ConvertWidget extends StatelessWidget {
  const ConvertWidget({
    super.key,
    required this.textEntry,
    required this.imageURL,
    required this.action,
  });

  final String textEntry;
  final String imageURL;
  final Function() action;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: action,
          child: Container(
            height: 55,
            width: 85,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                ClipRRect(
                  child: Image.network(
                    imageURL,
                    height: 35,
                  ),
                ),
                Text(textEntry),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
