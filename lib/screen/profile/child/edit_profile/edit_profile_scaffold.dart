import 'package:flutter/material.dart';
import 'package:magadh_tech_project/screen/profile/child/edit_profile/screen/edit_profile_screen.dart';

class EditProfileScaffold extends StatelessWidget {
  const EditProfileScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditProfileScreen(),
    );
  }
}
