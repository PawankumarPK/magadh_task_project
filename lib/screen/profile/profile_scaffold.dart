import 'package:flutter/material.dart';
import 'package:magadh_tech_project/screen/profile/screen/profile_screen.dart';

class ProfileScaffold extends StatelessWidget {
  const ProfileScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileScreen(),
    );
  }
}
