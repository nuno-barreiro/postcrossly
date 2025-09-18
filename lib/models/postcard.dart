import 'package:uuid/uuid.dart';

class Postcard {
  final String id;

  Postcard() : id = const Uuid().v4();
}
