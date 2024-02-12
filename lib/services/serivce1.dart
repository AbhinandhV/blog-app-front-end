import 'dart:convert';

import 'package:blogapp/model/model1.dart';
import 'package:http/http.dart' as http;
class users
{
  Future<dynamic> sendata(
      String name,String age,String phonenumber,
      String address,String pincode,String email,String password)async
  {
    var client=http.Client();
    var apiUrl=Uri.parse("http://172.16.182.129:3002/blog/add");
    var response=await client.post(apiUrl,
        headers: <String,String>
        {
          "Content-Type":"application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>
          {
            "name":name,
            "phonenumber":phonenumber,
            "age":age,
            "pincode":pincode,
            "address":address,
            "emai":email,
            "password":password
        }
        )
    );

    print(response);
    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else
    {
      print("hello");
      throw Exception("failed to load data");
    }

  }
}