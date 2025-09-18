import 'package:flutter/material.dart';
import 'package:postcrossly/models/postcard.dart';
import 'package:postcrossly/repositories/postcards_repository.dart';

/// A screen that displays a list of postcards.
class PostcardsListScreen extends StatefulWidget {
  /// The repository used to fetch postcards data.
  final PostcardsRepository postcardsRepo;

  /// Creates a [PostcardsListScreen]
  ///
  /// Arguments:
  ///   postcardsRepo: Required instance of [PostcardsRepository] to manage postcards data.
  const PostcardsListScreen({super.key, required this.postcardsRepo});

  @override
  State<PostcardsListScreen> createState() => _PostcardsListScreenState();
}

class _PostcardsListScreenState extends State<PostcardsListScreen> {
  List<Postcard> _postcards = [];

  @override
  void initState() {
    super.initState();
    _reloadState();
  }

  void _reloadState() {
    setState(() {
      _postcards = widget.postcardsRepo.fetchPostcards();
    });
  }

  void _addPostcard() {
    final postcard = Postcard();
    widget.postcardsRepo.addPostcard(postcard);
    _reloadState();
  }

  Widget _buildPostcardListItem(BuildContext context, int index) {
    final postcard = _postcards[index];
    return ListTile(title: Text(postcard.id));
  }

  Widget _buildWidgetBody() {
    if (_postcards.isEmpty) {
      return const Center(child: Text('No postcards available.'));
    }

    return ListView.separated(
      itemCount: _postcards.length,
      itemBuilder: _buildPostcardListItem,
      separatorBuilder: (context, index) => const Divider(height: 1),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Postcards')),
    body: _buildWidgetBody(),
    floatingActionButton: FloatingActionButton(
      onPressed: _addPostcard,
      tooltip: 'Add Postcard',
      child: const Icon(Icons.add),
    ),
  );
}
