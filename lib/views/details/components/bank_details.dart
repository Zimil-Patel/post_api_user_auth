
import 'package:flutter/material.dart';
import 'package:post_api_user_auth/model/user_model.dart';
import 'package:post_api_user_auth/views/home/components/smart_container.dart';

import 'build_rich_text.dart';

bankDetails(UserModel user){
  return smartContainer(
    Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Bank",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12,),
              buildRichText(label: 'cardExpire', value: user.bank.cardExpire),
              buildRichText(label: 'cardNumber', value: user.bank.cardNumber),
              buildRichText(label: 'cardType', value: user.bank.cardType),
              buildRichText(label: 'currency', value: user.bank.currency),
              buildRichText(label: 'iban', value: user.bank.iban),

            ],
          ),
        ),
      ],
    ),
  );
}