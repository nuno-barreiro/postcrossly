import 'package:flutter/material.dart';
import 'package:postcrossly/repositories/postcards_repository.dart';
import 'package:postcrossly/screens/postcards_list_screen.dart';

void main() {
  runApp(const PostcrosslyApp());
}

/// This is the main application widget.
class PostcrosslyApp extends StatelessWidget {
  /// Constructor
  const PostcrosslyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final postcardsRepository = PostcardsRepository();

    return MaterialApp(
      title: 'Postcrossly',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: PostcardsListScreen(postcardsRepo: postcardsRepository),
    );
  }
}
