import 'dart:convert';
import 'package:http/http.dart' as http;
class PostApiService
{
  Future<dynamic> postApi(
      String UserId,String post
      )async
  {
    var client=http.Client();
    var apiUrl=Uri.parse("http://10.100.15.113:3002/post/addpost");
    var response=await client.post(apiUrl,
        headers: <String,String>
        {
          "Content-Type":"application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>
        {
          "userId":UserId,
          "post":post
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