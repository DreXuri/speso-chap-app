// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:spesco_app/ui/widgets/common/custom_loading.dart';
// import 'package:stacked/stacked.dart';

// import 'user_list_model.dart';

// class UserList extends StackedView<UserListModel> {
//   const UserList({super.key});

//   @override
//   Widget builder(
//     BuildContext context,
//     UserListModel viewModel,
//     Widget? child,
//   ) {
//     return StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CustomLoading();
//           }
//           return ListView(
//             children: snapshot.data!.docs
//                 .map<Widget>((doc) => _buildUserListItem(doc))
//                 .toList(),
//           );
//         });
//   }

//   @override
//   UserListModel viewModelBuilder(
//     BuildContext context,
//   ) =>
//       UserListModel();
// }
