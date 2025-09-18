import 'package:postcrossly/models/postcard.dart';

/// Repository class for managing postcards
class PostcardsRepository {
  /// In-memory list to store postcards
  final List<Postcard> _postcards = [];

  /// Constructor
  PostcardsRepository();

  /// Adds a postcard to the repository
  ///
  /// Parameters:
  /// [postcard] The postcard to add
  ///
  /// Returns:
  /// The added postcard
  ///
  /// Throws:
  /// Exception if the postcard could not be added
  Postcard addPostcard(Postcard postcard) {
    _postcards.add(postcard);
    return postcard;
  }

  /// Fetches all postcards from the repository
  ///
  /// Returns:
  /// A list of all postcards in the repository
  List<Postcard> fetchPostcards() => _postcards;

  /// Retrieves a postcard by its ID
  ///
  /// Parameters:
  /// [id] The ID of the postcard to retrieve
  ///
  /// Returns:
  /// The postcard with the specified ID, or null if not found
  Postcard? getPostcard(String id) {
    try {
      return _postcards.singleWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}
