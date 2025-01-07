import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_api_user_auth/views/auth/auth_screen.dart';

class SavedUserScreen extends StatelessWidget {
  const SavedUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved users'),
      ),
      body: userController.savedUserList.isEmpty ? FutureBuilder(
        future: userController.fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: Colors.grey,),);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if(snapshot.hasData) {
            return const _UsersListView();
          }

        return const Center(child: Text('No Data'),);
      },) : const _UsersListView()
    );
  }
}

class _UsersListView extends StatelessWidget {
  const _UsersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) =>
          ListTile(
            onTap: () {
              final email = userController.savedUserList[index].email;
              final password = userController.savedUserList[index].password;
              userController.setControllers(email, password);
              Get.back();
            },
            leading: const Icon(Icons.person),
            title:  Text(userController.savedUserList[index].email),
            subtitle:  Text(userController.savedUserList[index].password),
            trailing: const Icon(Icons.arrow_right_rounded),
          ),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: 10,
    );
  }
}
