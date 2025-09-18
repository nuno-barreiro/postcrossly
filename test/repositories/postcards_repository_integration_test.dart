import 'package:flutter_test/flutter_test.dart';
import 'package:postcrossly/models/postcard.dart';
import 'package:postcrossly/repositories/postcards_repository.dart';

void main() {
  group('PostcardsRepository', () {
    late PostcardsRepository repository;

    setUp(() {
      repository = PostcardsRepository();
    });

    test('should add and get a postcard', () {
      final newPostcard = Postcard();
      repository.addPostcard(newPostcard);

      final getPostcardResult = repository.getPostcard(newPostcard.id);
      expect(getPostcardResult, isNotNull);
      expect(getPostcardResult!.id, newPostcard.id);
      expect(getPostcardResult, newPostcard);
    });

    test('should return null for non-existing postcard', () {
      final result = repository.getPostcard('non-existing-id');
      expect(result, isNull);
    });

    test('should fetch all postcards', () {
      final postcard1 = Postcard();
      final postcard2 = Postcard();
      repository.addPostcard(postcard1);
      repository.addPostcard(postcard2);

      final postcards = repository.fetchPostcards();
      expect(postcards.length, 2);
      expect(postcards, containsAll([postcard1, postcard2]));
    });
  });
}
