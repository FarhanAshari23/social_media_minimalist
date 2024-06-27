import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/database/firestore.dart';
import 'package:social_media_app/widget/my_buttonpost.dart';
import 'package:social_media_app/widget/my_drawer.dart';
import 'package:social_media_app/widget/my_listitle_post.dart';
import 'package:social_media_app/widget/my_textfield.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final FirestoreDatabase firestore = FirestoreDatabase();

  final TextEditingController postController = TextEditingController();

  void postMessage() {
    if (postController.text.isNotEmpty) {
      String message = postController.text;
      firestore.addPost(message);
      postController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('W A L L'),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                      controller: postController,
                      hintText: 'Lets say something..',
                      obsecureText: false),
                ),
                MyButtonPost(
                  onTap: postMessage,
                )
              ],
            ),
          ),
          StreamBuilder(
            stream: firestore.getPostsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                );
              }
              final posts = snapshot.data!.docs;
              if (snapshot.data == null || posts.isEmpty) {
                return const Center(
                  child: Text('No posts.. post something!'),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];

                    String message = post['messagePosts'];
                    String userEmail = post['UserEmail'];
                    Timestamp timestamp = post['timestamp'];

                    return ListTilePost(message: message, userEmail: userEmail);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
