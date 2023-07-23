import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/api_services/firebase_service/firebase_service.dart';
import 'package:magadh_tech_project/binding/controllers_binding.dart';
import 'package:magadh_tech_project/screen/auth/sign_in/signin_scaffold.dart';
import 'package:magadh_tech_project/screen/map/map_scaffold.dart';
import 'package:magadh_tech_project/utils/custom_object/custom_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

var prefToken;
var userId;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseService().firebaseNotificationInit();



  var prefs = await SharedPreferences.getInstance();
  prefToken = prefs.getString("token");
  CustomObject.token = prefToken??"";
  print("===>> TOKEN  "+ CustomObject.token);

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: ControllersBinding(),
        debugShowCheckedModeBanner: false,
        title: 'Magadh Tech',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: prefToken == null ? const SignInScaffold() : const MapScaffold()
        //home: const SignInScaffold()
    );
  }



}
