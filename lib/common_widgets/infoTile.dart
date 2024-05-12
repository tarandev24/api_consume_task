import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InfoTile extends StatelessWidget {
  InfoTile({required this.label, required this.value, super.key});

  String label;
  String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label :',
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        Text(value),
      ],
    );
  }
}
