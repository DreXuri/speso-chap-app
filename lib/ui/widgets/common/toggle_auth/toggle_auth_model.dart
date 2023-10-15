import 'package:stacked/stacked.dart';

class ToggleAuthModel extends BaseViewModel {
  bool showLoginScreen = true;

  void togglePages() {
    showLoginScreen = !showLoginScreen;
    rebuildUi();
  }
}
