import 'package:get/get.dart';
import 'package:magadh_tech_project/common_widget/session_timeout_dialog_box.dart';
import 'package:magadh_tech_project/main.dart';
import 'package:magadh_tech_project/screen/auth/otp_verification/controller/otp_verification_controller.dart';
import 'package:magadh_tech_project/screen/auth/sign_in/signin_scaffold.dart';
import 'package:magadh_tech_project/screen/map/controller/map_controller.dart';
import 'package:magadh_tech_project/screen/profile/model/profile_detail_model.dart';
import 'package:magadh_tech_project/utils/custom_object/animation_message.dart';
import 'package:magadh_tech_project/api_services/repository/get_routes.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/utils/custom_object/custom_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController{

  RxBool isLoading = false.obs;
  var flutterToast = AnimationMessage();
  RxString name = "".obs;
  RxString contactNo = "".obs;
  RxString emailId = "".obs;
  RxString profileImage = "".obs;


  @override
  void onInit() {
    super.onInit();
    verifyTokenApiFunction();
  }

  ///--------- verify token and get user detail api -----------
  Future<bool> verifyTokenApiFunction() async {
    try {
      isLoading.value = true;
      await GetRoutes.verifyToken();


      switch (CustomObject.responseStatus) {
        case 200:
          final result = profileDetailModelFromJson(CustomObject.responseBody.body);
          name.value = result.user.name;
          contactNo.value = result.user.phone;
          emailId.value = result.user.email;
          profileImage.value = result.user.image;
          break;
        case 401:
          Get.dialog( SessionTimeOutDialogBox(errorCode: ConstantStrings.errorCode401,));
          break;

        case 404:
          Get.dialog( SessionTimeOutDialogBox(errorCode: ConstantStrings.errorCode404,));
          break;

        default:
          flutterToast.toast(ConstantStrings.somethingWentWrong);
      }
    } finally {
      isLoading.value = false;
    }
    return true;

  }

  void logoutFunction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.delete<MapController>();
    //Get.delete<ProfileController>();
    Get.deleteAll();
    Get.offAll(()=> const SignInScaffold());
    //Get.reset();
  }
}