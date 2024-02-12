import 'package:blogapp/pages/singup.dart';
import 'package:flutter/material.dart';

class frontpage extends StatefulWidget {
  const frontpage({super.key});

  @override
  State<frontpage> createState() => _frontpageState();
}

class _frontpageState extends State<frontpage> {
  TextEditingController username1=new TextEditingController();
  TextEditingController password1=new TextEditingController();
  @override
  void signin()
  {
    print("USERNAME :"+username1.text);
    print("PASSWORD :"+password1.text);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Container(
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
    );
  }
}
