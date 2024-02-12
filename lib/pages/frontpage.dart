import 'package:blogapp/pages/addpost.dart';
import 'package:blogapp/pages/menu.dart';
import 'package:blogapp/pages/singup.dart';
import 'package:blogapp/services/serivce1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class frontpage extends StatefulWidget {
  const frontpage({super.key});

  @override
  State<frontpage> createState() => _frontpageState();
}

class _frontpageState extends State<frontpage> {
  TextEditingController username1=new TextEditingController();
  TextEditingController password1=new TextEditingController();
  @override
  void signin()async
  {
    final response=await users().loginapi(
        username1.text,
        password1.text);
    if(response["status"]=="success")
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>menu()));
        String userid=response["userdata"]["_id"].toString();
        SharedPreferences.setMockInitialValues({});
        SharedPreferences preferences=await SharedPreferences.getInstance();
        preferences.setString("userId", userid);
        print("successfull login"+userid);
      }
    else if(response["status"]=="no user")
    {
      print("invalid userid");

    }
    else
      {
        print("invalid credentials");
      }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: username1,
                decoration: InputDecoration(labelText: "enter username",border: OutlineInputBorder()),),
              SizedBox(height: 30,),
              TextField(controller: password1,
                decoration: InputDecoration(labelText: "enter password",border: OutlineInputBorder()),),
              SizedBox(height: 30,),
              ElevatedButton(onPressed:signin, child: Text("login")),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>singup()));
              }, child: Text("new user")),
        
        
            ],
          ),
        ),
      ),
    );
  }
}
