import 'package:flutter/material.dart';

import '../../features/profile/exports.dart';
import '../../shared/constants/text_constant.dart';
import '../../widgets/project/c_appbar.dart';

class ProfileScreen extends StatelessWidget {
  static const route = 'ProfileScreen';

  final RouteSettings settings;
  const ProfileScreen({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(title: "Profil").build(context),
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(12),
                child: HeaderWidget(
                  profileImageUrl: TextConstants.getRandomImageUrl("profile"),
                ),
              ),
            ]),
          ),
        ],
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabWidget(),
              Expanded(
                child: TabBarView(children: [GridWidget(), MasonryWidget()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
