import 'package:flutter/material.dart';

class ReuseableRow extends StatelessWidget {
  String title, values;

  ReuseableRow({super.key, required this.title, required this.values});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(values),
            ],
          ),
        ),
      ],
    );
  }
}
