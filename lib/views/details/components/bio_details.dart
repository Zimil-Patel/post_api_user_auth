
import 'package:flutter/material.dart';
import 'package:post_api_user_auth/model/user_model.dart';
import 'package:post_api_user_auth/views/home/components/smart_container.dart';

import 'build_rich_text.dart';

bioDetails(UserModel user){
  return smartContainer(
    Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Bio",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12,),
              buildRichText(label: 'Full Name', value: "${user.firstName} ${user.maidenName} ${user.lastName}"),
              buildRichText(label: 'Age', value: user.age.toString()),
              buildRichText(label: 'Gender', value: user.gender),
              buildRichText(label: 'DOD', value: user.birthDate),
              buildRichText(label: 'Blood group', value: user.bloodGroup),
              buildRichText(label: 'Height', value: user.height.toString()),
              buildRichText(label: 'Weight', value: user.weight.toString()),
              buildRichText(label: 'Eye color', value: user.eyeColor),
              buildRichText(label: 'Hair', value: "color: ${user.hair.color} type: ${user.hair.type}"),
              buildRichText(label: 'University', value: user.university),
              buildRichText(label: 'Phone', value: user.phone),
              buildRichText(label: 'Email', value: user.email),
            ],
          ),
        ),
      ],
    ),
  );
}