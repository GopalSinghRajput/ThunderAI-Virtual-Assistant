import 'package:flutter/material.dart';
import 'package:gopal/pallete.dart';

class FeatureBox extends StatelessWidget {
  final Color color;
  final String headertext;
  final String description;
  const FeatureBox(
      {super.key,
      required this.color,
      required this.headertext,
      required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10)
              .copyWith(left: 15, bottom: 5, top: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              headertext,
              style: const TextStyle(
                fontFamily: 'Cera',
                color: Pallete.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // const SizedBox(height: 1),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 13, bottom: 10),
          child: Text(
            description,
            style: const TextStyle(
              fontFamily: 'Cera',
              fontWeight: FontWeight.bold,
              color: Pallete.blackColor,
            ),
          ),
        )
      ]),
    );
  }
}
