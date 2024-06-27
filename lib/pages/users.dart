import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/widget/my_backbutton.dart';
import 'package:social_media_app/widget/my_errordialog.dart';
import 'package:social_media_app/widget/my_listitle_post.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            displayErrorMessage('There is something error', context);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return const Text("No Data");
          }
          final users = snapshot.data!.docs;

          return Column(children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 50, bottom: 10),
              child: Row(
                children: [
                  MyBackButton(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTilePost(
                      message: user['username'], userEmail: user['email']);
                },
              ),
            ),
          ]);
        },
      ),
    );
  }
}
