import 'package:blogapp/services/service2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class addpost extends StatefulWidget {
  const addpost({super.key});

  @override
  State<addpost> createState() => _addpostState();
}

class _addpostState extends State<addpost> {
  TextEditingController post1=new TextEditingController();
  void postAi()
  async
  {
    print("post:"+post1.text);
    SharedPreferences prefer=await SharedPreferences.getInstance();
    String userId=prefer.getString("userId")?? "";
    final response=await PostApiService().postApi(
        userId,
        post1.text);
    if(response["status"]=="success")
      {
        print("post created");
      }
    else
      {
        print("error");
      }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: post1,
                decoration: InputDecoration(labelText: "post",border: OutlineInputBorder()),),
              SizedBox(height: 30,),
              ElevatedButton(onPressed:postAi
              , child: Text("add")),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("back"))

            ],
          ),
        ),
      ),
    );
  }
}
