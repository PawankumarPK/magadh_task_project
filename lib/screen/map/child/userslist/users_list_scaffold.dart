import 'package:flutter/material.dart';
import 'package:magadh_tech_project/screen/map/child/userslist/screen/users_list_screen.dart';


class UsersListScaffold extends StatelessWidget {
  const UsersListScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UsersListScreen(),
    );
  }
}
