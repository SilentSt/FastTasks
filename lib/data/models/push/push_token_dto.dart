import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class PushTokenDto with Mappable {
  PushTokenDto({
    required this.pushToken,
  });

  final String pushToken;
}
