import 'package:uuid/uuid.dart';

/// Model class for a postcard
class Postcard {
  /// Unique identifier for the postcard
  final String id;

  /// Constructor
  Postcard() : id = const Uuid().v4();
}
