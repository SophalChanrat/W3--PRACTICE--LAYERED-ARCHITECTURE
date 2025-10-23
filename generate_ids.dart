import 'package:uuid/uuid.dart';

void main() {
  var uuid = Uuid();

  // Generate 5 UUIDs 
  for (int i = 0; i < 5; i++) {
    print(uuid.v4());
  }
}