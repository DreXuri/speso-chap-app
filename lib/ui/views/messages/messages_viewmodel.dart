import 'package:spesco_app/services/chat_servic_service.dart';
import 'package:spesco_app/ui/common/app_images.dart';
import 'package:spesco_app/ui/model/chat_header_model.dart';
import 'package:spesco_app/ui/model/user_model.dart';
import 'package:spesco_app/ui/utilities/string_utils.dart';
import 'package:stacked/stacked.dart';

class MessagesViewModel extends BaseViewModel {
  final ChatServicService chatServi  = ChatServicService();

  List<ChatHeaderModel> chatHeaders() {
    return [
      ChatHeaderModel(
        user: const User(
          email: 'mail@user.com',
          name: 'AXA Mansard',
          image: AppImages.logo,
        ),
        message: "haha that's terrifying 🤣",
        time: '${getTime()} PM',
        numberOfMessages: 2,
        isRead: false,
      ),
      ChatHeaderModel(
        user: const User(
          email: 'mail@user.com',
          name: 'Great Nigeria Insurance',
          image: AppImages.logo,
        ),
        message: "haha that's terrifying 🤣",
        time: '${getTime()} PM',
        numberOfMessages: 2,
        isRead: false,
      ),
      ChatHeaderModel(
        user: const User(
          email: 'mail@user.com',
          name: 'Custodian',
          image: AppImages.logo,
        ),
        message: "haha that's terrifying",
        time: '${getTime()} PM',
        numberOfMessages: 0,
        isRead: true,
      ),
      ChatHeaderModel(
        user: const User(
          email: 'mail@user.com',
          name: 'LEADWAY Assurance',
          image: AppImages.logo,
        ),
        message: "haha that's terrifying",
        time: '${getTime()} PM',
        numberOfMessages: 0,
        isRead: true,
      ),
      ChatHeaderModel(
        user: const User(
          email: 'mail@user.com',
          name: 'AXA Mansard',
          image: AppImages.logo,
        ),
        message: "haha that's terrifying",
        time: '${getTime()} PM',
        numberOfMessages: 2,
        isRead: false,
      ),
      ChatHeaderModel(
        user: const User(
          email: 'mail@user.com',
          name: 'Custodian',
          image: AppImages.logo,
        ),
        message: "haha that's terrifying 🤣",
        time: '${getTime()} PM',
        numberOfMessages: 0,
        isRead: true,
      ),
      ChatHeaderModel(
        user: const User(
          email: 'mail@user.com',
          name: 'LEADWAY Assurance',
          image: AppImages.logo,
        ),
        message: "haha that's terrifying 🤣",
        time: '${getTime()} PM',
        numberOfMessages: 0,
        isRead: true,
      ),
    ];
  }
}
