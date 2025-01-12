import 'package:flutter/material.dart';

RichText buildRichText({required String label, value}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: '$label: ',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white54,
          ),
        ),
        TextSpan(
          text: value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
