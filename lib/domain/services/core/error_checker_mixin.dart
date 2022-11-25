import 'package:chopper/chopper.dart';

mixin ErrorChecker {
  bool errorChecker(
    Response res, {
    bool nullableBody = true,
  }) {
    if (res.isSuccessful && (nullableBody || res.body != null)) {
      return true;
    } else {
      return false;
    }
  }
}
