import 'package:flutter/material.dart';
import 'package:post_api_user_auth/model/user_model.dart';
import 'package:post_api_user_auth/views/details/components/address_details.dart';
import 'package:post_api_user_auth/views/details/components/bank_details.dart';
import 'package:post_api_user_auth/views/details/components/basic_details.dart';
import 'package:post_api_user_auth/views/details/components/bio_details.dart';
import 'package:post_api_user_auth/views/details/components/company_details.dart';
import 'package:post_api_user_auth/views/details/components/crypto_details.dart';
import 'package:post_api_user_auth/views/details/components/other_details.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.user});

  final UserModel user;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Info"),
      ),
      
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // User details
            basicDetails(user),

            // Bio details
            bioDetails(user),

            // Address
            addressContainer(user),

            // Company
            companyDetails(user),

            // Bank
            bankDetails(user),

            // Crypto
            cryptoDetails(user),

            // Other
            otherDetails(user),

            const SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
