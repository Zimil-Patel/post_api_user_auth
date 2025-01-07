import 'package:flutter/material.dart';

class SavedUserScreen extends StatelessWidget {
  const SavedUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved users'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const Card(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text('admin123@gmail.com'),
            subtitle: Text('123456789'),
            trailing: Icon(Icons.arrow_right_rounded),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: 10,
      ),
    );
  }
}
