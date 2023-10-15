import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spesco_app/app/app.bottomsheets.dart';
import 'package:spesco_app/app/app.dialogs.dart';
import 'package:spesco_app/app/app.locator.dart';
import 'package:spesco_app/app/app.router.dart';
import 'package:spesco_app/services/auth_guard_service.dart';
import 'package:spesco_app/ui/common/app_strings.dart';
import 'package:spesco_app/ui/model/chat_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  FirebaseAuth auth = FirebaseAuth.instance;

  String get counterLabel => 'Counter is: $_counter';
  List<ChatModel> chats = [];

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  void signOut() {
    final _apiService = locator<AuthGuardService>();
    _apiService.signOut();
  }

  Future<void> pickFile() async {
    chats.add(ChatModel(
      message: '',
      time: Timestamp.now(),
      isSent: false,
      isReceived: false,
      userId: '',
      readerId: '',
      senderEmail: '',
    ));
  }

  void navigateToChatsView(email, uid) {
    _navigationService.navigateTo(
      Routes.chatsView,
      arguments: ChatsViewArguments(userEmail: email, userId: uid),
    );
  }
}
