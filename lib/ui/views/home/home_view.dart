import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spesco_app/generated/l10n.dart';
import 'package:spesco_app/ui/extension/app_typography.dart';
import 'package:spesco_app/ui/extension/palette.dart';
import 'package:stacked/stacked.dart';
import 'package:spesco_app/ui/common/ui_helpers.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    FirebaseAuth _auth = FirebaseAuth.instance;

    final ThemeData theme = Theme.of(context);
    final AppTypography? typography = theme.extension<AppTypography>();
    final Palette? palette = theme.extension<Palette>();

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            S.current.home,
            style: typography?.headlineBold28?.copyWith(color: palette?.gray11),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: sidePadding),
              child: InkWell(
                onTap: viewModel.signOut,
                child: Icon(Icons.logout),
              ),
            ),
          ],
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                Text('hass error');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                Text('loadig');
              }
              return ListView(
                children: snapshot.data!.docs.map<Widget>(
                  (doc) {
                    Map<String, dynamic> data = doc.data();
                    if (_auth.currentUser?.email != data['email']) {
                      return ListTile(
                          title: Text(data['email']),
                          onTap: () {
                            viewModel.navigateToChatsView(
                                data['email'], data['uid']);
                          });
                    }
                    return Container();
                  },
                ).toList(),
              );
            }));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
