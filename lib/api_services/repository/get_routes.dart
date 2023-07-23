import 'package:http/http.dart' as http;
import 'package:magadh_tech_project/api_services/url/config.dart';
import 'package:magadh_tech_project/utils/custom_object/custom_object.dart';

var headers = {
  'Content-Type': 'application/json',
  "Authorization": 'token ${CustomObject.token}',
};
class GetRoutes {


  ///-------------------- verify token  ------------------------
  static verifyToken() async {
    var url = "${Config.BASE_URL}${Config.USER_MIDDLEWARE}/verify-token";

    CustomObject.responseBody = await http.get(Uri.parse(url), headers: headers);
    CustomObject.responseStatus = CustomObject.responseBody.statusCode;
  }

  ///-------------------- get all users  ------------------------
  static getAllUsers() async {
    var url = "${Config.BASE_URL}${Config.USER_MIDDLEWARE}?limit=10&page=1";
    CustomObject.responseBody = await http.get(Uri.parse(url), headers: headers);
    CustomObject.responseStatus = CustomObject.responseBody.statusCode;
  }


}
