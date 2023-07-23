import 'package:get/get.dart';
import 'package:magadh_tech_project/screen/auth/otp_verification/controller/otp_verification_controller.dart';
import 'package:magadh_tech_project/screen/auth/sign_in/controller/signin_controller.dart';
import 'package:magadh_tech_project/screen/map/child/add_user/child/controller/new_user_map_controller.dart';
import 'package:magadh_tech_project/screen/map/child/add_user/controller/add_user_controller.dart';
import 'package:magadh_tech_project/screen/map/child/userslist/controller/userslist_controller.dart';
import 'package:magadh_tech_project/screen/map/controller/map_controller.dart';
import 'package:magadh_tech_project/screen/profile/controller/profile_controller.dart';

class ControllersBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
    Get.lazyPut<OtpVerificationController>(() => OtpVerificationController());
    Get.lazyPut<MapController>(() => MapController());
    Get.lazyPut<UsersListController>(() => UsersListController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<AddUserController>(() => AddUserController());
    Get.lazyPut<NewUserMapController>(() => NewUserMapController());
  }

}