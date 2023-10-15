import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spesco_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:spesco_app/services/auth_guard_service.dart';

import 'package:spesco_app/services/chat_servic_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthGuardService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ChatServicService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterAuthGuardService();
  getAndRegisterChatServiceService();
  getAndRegisterChatServiceService();
  getAndRegisterChatServiceService();
  getAndRegisterChatServicService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockAuthGuardService getAndRegisterAuthGuardService() {
  _removeRegistrationIfExists<AuthGuardService>();
  final service = MockAuthGuardService();
  locator.registerSingleton<AuthGuardService>(service);
  return service;
}

MockChatServiceService getAndRegisterChatServiceService() {
  _removeRegistrationIfExists<ChatServiceService>();
  final service = MockChatServiceService();
  locator.registerSingleton<ChatServiceService>(service);
  return service;
}

MockChatServiceService getAndRegisterChatServiceService() {
  _removeRegistrationIfExists<ChatServiceService>();
  final service = MockChatServiceService();
  locator.registerSingleton<ChatServiceService>(service);
  return service;
}

MockChatServiceService getAndRegisterChatServiceService() {
  _removeRegistrationIfExists<ChatServiceService>();
  final service = MockChatServiceService();
  locator.registerSingleton<ChatServiceService>(service);
  return service;
}

MockChatServicService getAndRegisterChatServicService() {
  _removeRegistrationIfExists<ChatServicService>();
  final service = MockChatServicService();
  locator.registerSingleton<ChatServicService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
