import 'package:flutter/material.dart';
import 'package:magadh_tech_project/screen/map/child/add_user/child/screen/new_user_map_screen.dart';

class NewUserMapScaffold extends StatelessWidget {
  const NewUserMapScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NewUserMapScreen(),
    );
  }
}
