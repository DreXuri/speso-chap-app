import 'package:stacked/stacked.dart';

class AuthTogglePagesViewModel extends BaseViewModel {
  bool _isLogin = true;
  bool get isLogin => _isLogin;

  void toggleView() {
    _isLogin = !_isLogin;
    notifyListeners();
  }
}
