import 'package:flutter/widgets.dart';
import 'package:tasklet/presentation/app/app.dart';

class HideProvider {
  final VoidCallback hide;
  final VoidCallback show;
  bool ignore = false;

  HideProvider({
    required this.hide,
    required this.show,
  }) {
    App.router.addListener(
      () {
        if (!ignore) {
          show();
        } else {
          hide();
        }
      },
    );
  }
}
