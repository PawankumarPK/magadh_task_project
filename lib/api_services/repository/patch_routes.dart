import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:magadh_tech_project/api_services/url/config.dart';
import 'package:magadh_tech_project/utils/custom_object/custom_object.dart';
import 'package:magadh_tech_project/utils/custom_object/flutter_toast.dart';

class PatchRoutes {



  ///-------------------- Edit user detail api ------------------------
  static Future<void> updateUserProfile(String location,String name, File file) async {
    var url = "${Config.BASE_URL}${Config.USER_MIDDLEWARE}";

    var request = http.MultipartRequest('PATCH', Uri.parse(url));

    Map<String, String> headers = {
      "Authorization": 'token ${CustomObject.token}',
      "Content-type": "multipart/form-data"
    };

    request.files.add(await http.MultipartFile.fromPath('image', file.path));
    request.fields.addAll({"location":location,"name": name,});
    request.headers.addAll(headers);
    CustomObject.responseBody = await request.send();
    print("=====<><><><IMGG  "+ CustomObject.responseBody.statusCode.toString());
    CustomObject.responseStatus = CustomObject.responseBody.statusCode;
  }

}
