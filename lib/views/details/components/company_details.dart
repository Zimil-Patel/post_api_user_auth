
import 'package:flutter/material.dart';
import 'package:post_api_user_auth/model/user_model.dart';
import 'package:post_api_user_auth/views/home/components/smart_container.dart';

import 'build_rich_text.dart';

companyDetails(UserModel user){
  return smartContainer(
    Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Company",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12,),
              buildRichText(label: 'Name', value: user.company.name),
              buildRichText(label: 'Department', value: user.company.department),
              buildRichText(label: 'Title', value: user.company.title),
              buildRichText(label: 'Title', value: user.company.title),

              const SizedBox(height: 12,),
              const Text(
                "Address",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              ),

              buildRichText(label: 'state code', value: user.company.address.stateCode),
              buildRichText(label: 'postal code', value: user.company.address.postalCode),
              buildRichText(label: 'country', value: user.company.address.country),
              buildRichText(label: 'coordinates', value: "lat: ${user.company.address.coordinates.lat}, lng: ${user.company.address.coordinates.lng}"),
            ],
          ),
        ),
      ],
    ),
  );
}