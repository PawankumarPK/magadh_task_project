import 'package:flutter/material.dart';
import 'package:magadh_tech_project/screen/map/child/add_user/screen/add_user_screen.dart';

class AddUserScaffold extends StatelessWidget {
  const AddUserScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddUserScreen(),
    );
  }
}
