import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:magadh_tech_project/api_services/url/config.dart';
import 'package:magadh_tech_project/utils/custom_object/custom_object.dart';

var headers = {
  'Content-Type': 'application/json',
  "Authorization": '${CustomObject.token}',
};

class PostRoutes {

  ///-------------------- Send OTP api  ------------------------
  static Future<void> sendOtp(String phone) async {
    var url = "${Config.BASE_URL}${Config.USER_MIDDLEWARE}/login-request";
    final body = {"phone": phone};

    CustomObject.responseBody = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
    CustomObject.responseStatus = CustomObject.responseBody.statusCode;
  }

  ///-------------------- user login verify ------------------------
  static Future<void> loginVerify(String phone, String otp) async {
    var url = "${Config.BASE_URL}${Config.USER_MIDDLEWARE}/login-verify";
    final body = {
      "phone": phone,
      "otp":otp
    };
    CustomObject.responseBody = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
    CustomObject.responseStatus = CustomObject.responseBody.statusCode;
  }

  ///-------------------- Add new user ------------------------
  static Future<void> addNewUser(String name,String email,String phone,double latitude,double longitude) async {
    var url = "${Config.BASE_URL}${Config.USER_MIDDLEWARE}";

    String body = json.encode({
      "name": name,
      "email": email,
      "phone": phone,
      'location' : {
        "latitude":latitude,
        "longitude":longitude
      }
    });

    CustomObject.responseBody = await http.post(Uri.parse(url), headers: headers = {
      'Content-Type': 'application/json',
      "Authorization": '${CustomObject.token}',
    }, body: body);
    CustomObject.responseStatus = CustomObject.responseBody.statusCode;
  }

}
