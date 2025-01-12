
import 'package:flutter/material.dart';
import 'package:post_api_user_auth/model/user_model.dart';
import 'package:post_api_user_auth/views/home/components/smart_container.dart';

import 'build_rich_text.dart';

addressContainer(UserModel user){
  return smartContainer(
    Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Address",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12,),
              Text(
                "${user.address.address}, ${user.address.city}, ${user.address.state}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              buildRichText(label: 'state code', value: user.address.stateCode),
              buildRichText(label: 'postal code', value: user.address.postalCode),
              buildRichText(label: 'country', value: user.address.country),
              buildRichText(label: 'coordinates', value: "lat: ${user.address.coordinates.lat}, lng: ${user.address.coordinates.lng}"),
            ],
          ),
        ),
      ],
    ),
  );
}