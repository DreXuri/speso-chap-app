import 'package:spesco_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:spesco_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:spesco_app/ui/views/home/home_view.dart';
import 'package:spesco_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:spesco_app/ui/views/login/login_view.dart';
import 'package:spesco_app/services/auth_guard_service.dart';
import 'package:spesco_app/ui/views/register/register_view.dart';
import 'package:spesco_app/ui/views/chats/chats_view.dart';
import 'package:spesco_app/ui/views/messages/messages_view.dart';
import 'package:spesco_app/ui/views/auth_toggle_pages/auth_toggle_pages_view.dart';

import 'package:spesco_app/services/chat_servic_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    AdaptiveRoute(page: HomeView),
    AdaptiveRoute(page: StartupView),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: RegisterView),
    AdaptiveRoute(page: ChatsView),
    AdaptiveRoute(page: MessagesView),
    AdaptiveRoute(page: AuthTogglePagesView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthGuardService),

    LazySingleton(classType: ChatServicService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
