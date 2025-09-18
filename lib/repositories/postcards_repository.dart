import 'package:postcrossly/models/postcard.dart';

class PostcardsRepository {
  final List<Postcard> _postcards = [];

  Postcard addPostcard(Postcard postcard) {
    _postcards.add(postcard);
    return postcard;
  }

  List<Postcard> fetchPostcards() {
    return _postcards;
  }

  Postcard? getPostcard(String id) {
    try {
      return _postcards.singleWhere((postcard) => postcard.id == id);
    } catch (e) {
      return null;
    }
  }
}
