import 'package:blogapp/model/viewpostmodel.dart';
import 'package:http/http.dart' as http;
class displayapi
{
  Future<List<Display>> displaypost() async
  {
    var client=http.Client();
    var url=Uri.parse("http://10.100.15.113:3002/post/viewpost");
    var response=await client.get(url);
    if(response.statusCode==200)
    {
      return displayFromJson(response.body);
    }
    else
    {
      return [];
    }
  }
}