import 'package:flutter/material.dart';

import '../user_profile.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        UserAvatarWidget(),
        SizedBox(height: 8),
        UserNameWidget(),
        UserSpecialityWidget(),
        UserSubSpecialityWidget(),
        SizedBox(height: 8),
        UserMemberSinceWidget(),
        SizedBox(height: 16),
        Divider(height: 4, thickness: 1),
        UserMiniStatsWidget(),
        Divider(height: 4, thickness: 1),
        // //const UserPracticeLocations(),
        UserAboutWidget(),
      ],
    );
  }
}
