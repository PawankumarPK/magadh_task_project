import 'package:get/get.dart';
import 'package:magadh_tech_project/utils/custom_object/animation_message.dart';
import 'package:url_launcher/url_launcher.dart';

class UsersListController extends GetxController {
  var isLoading = false.obs;
  var flutterToast = AnimationMessage();

  Uri? phoneUrl;
  RxString contactNo = "".obs;


  ///-------------- Call on user contact number ----------
  Future<bool> callNow() async {
    phoneUrl = Uri(
      scheme: 'tel',
      path: contactNo.value,
    );
    launchUrl(phoneUrl!);
    return  true;

  }
}
