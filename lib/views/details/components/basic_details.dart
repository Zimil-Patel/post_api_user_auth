import 'package:post_api_user_auth/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:post_api_user_auth/views/home/components/smart_container.dart';

basicDetails(UserModel user){
  return smartContainer(
    Row(
      children: [
        // IMAGE
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(user.image),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FIRST LAST NAME
              Text(
                "${user.firstName} ${user.lastName} (${user.username})",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // EMAIL
              Text(
                user.email,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}