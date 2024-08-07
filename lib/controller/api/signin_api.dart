
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
class SigninApi{

  static signinapi({required String email, required String pass})async{
    try{
      log("message");
      log("=========$email      $pass====");
      log("................");
      Uri url = Uri.parse("https://cit-ecommerce-codecanyon.bandhantrade.com/api/login");
      var body ={
        "email_phone":email,
        "password":pass
      };
      var respone = await http.post(url,body: body);
      log("${respone.statusCode}");
      if(respone.statusCode==200){
        var data = jsonDecode(respone.body);
        String token =data['token'] ?? "null";
        log(".........token :$token");
        return true;
      }
    }catch (e){
      log("$e");
    }
    return false;
  }
}