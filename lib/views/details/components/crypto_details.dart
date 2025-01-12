
import 'package:flutter/material.dart';
import 'package:post_api_user_auth/model/user_model.dart';
import 'package:post_api_user_auth/views/home/components/smart_container.dart';

import 'build_rich_text.dart';

cryptoDetails(UserModel user){
  return smartContainer(
    Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Crypto",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12,),
              buildRichText(label: 'Coin', value: user.crypto.coin),
              buildRichText(label: 'Wallet', value: user.crypto.wallet),
              buildRichText(label: 'Network', value: user.crypto.network),
            ],
          ),
        ),
      ],
    ),
  );
}