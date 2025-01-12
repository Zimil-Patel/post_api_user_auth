
import 'package:flutter/material.dart';
import 'package:post_api_user_auth/model/user_model.dart';
import 'package:post_api_user_auth/views/home/components/smart_container.dart';

import 'build_rich_text.dart';

otherDetails(UserModel user){
  return smartContainer(
    Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Other",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12,),
              buildRichText(label: 'IP', value: user.ip),
              buildRichText(label: 'mac Address', value: user.macAddress),
              buildRichText(label: 'ein', value: user.ein),
              buildRichText(label: 'ssn', value: user.ssn),
              buildRichText(label: 'User agent', value: user.userAgent),
              buildRichText(label: 'Role', value: user.role),
            ],
          ),
        ),
      ],
    ),
  );
}