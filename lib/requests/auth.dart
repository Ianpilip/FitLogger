import 'dart:convert';
import 'package:http/http.dart';
import 'package:FitLogger/constants/logic_settings.dart' as LogicSettings;

class AuthRequests {

  Future<Map<String, dynamic>> auth(String email, String password, bool restorePassword) async{
    String url = LogicSettings.urlAddressToSendRequests + '/user/auth';

    Map<String, String> headers = {"Content-type": "application/json"};
    String json = jsonEncode(<String, dynamic>{
      'email': email,
      'password': password,
      'restorePassword': restorePassword
    });

    Response response = await post(Uri.parse(url), headers: headers, body: json);
    Map<String, dynamic> jsonDecoded = jsonDecode(response.body);
    return jsonDecoded;
  }

  Future<Map<String, dynamic>> refreshToken(String userID) async{
    String url = LogicSettings.urlAddressToSendRequests + '/user/refresh-token';
    
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = jsonEncode(<String, dynamic>{
      'userID': userID
    });

    Response response = await post(Uri.parse(url), headers: headers, body: json);
    Map<String, dynamic> jsonDecoded = jsonDecode(response.body);
    return jsonDecoded;
  }

}