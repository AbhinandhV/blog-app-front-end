
import 'package:blogapp/pages/frontpage.dart';
import 'package:blogapp/services/serivce1.dart';
import 'package:flutter/material.dart';

class singup extends StatefulWidget {
  const singup({super.key});

  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
  TextEditingController name1=new TextEditingController();
  TextEditingController age1=new TextEditingController();
  TextEditingController phonenumber1=new TextEditingController();
  TextEditingController address1=new TextEditingController();
  TextEditingController pincode1=new TextEditingController();
  TextEditingController email1=new TextEditingController();
  TextEditingController password1=new TextEditingController();

  void sendvalue()
  async
  {
    print("Name"+name1.text);
    print("Name"+age1.text);
    print("Name"+phonenumber1.text);
    print("Name"+address1.text);
    print("Name"+pincode1.text);
    print("Name"+email1.text);
    print("Name"+password1.text);

    final response= await users().sendata(
        name1.text,
        age1.text,
        phonenumber1.text,
        address1.text,
        pincode1.text,
        email1.text,
        password1.text);
    if (response["status"]=="success")
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>frontpage()));
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
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(controller: name1,
                  decoration: InputDecoration(labelText: "NAME",border: OutlineInputBorder()),),
                SizedBox(height: 20,),
                TextField(
                  controller: age1,
                  decoration: InputDecoration(labelText: "AGE",border: OutlineInputBorder()),),
                SizedBox(height: 20,),
                TextField(
                  controller: phonenumber1,
                  decoration: InputDecoration(labelText: "PHONE  NUMBER",border: OutlineInputBorder()),),
                SizedBox(height: 20,),
                TextField(
                  controller: address1,
                  decoration: InputDecoration(labelText: "ADDRESS",border: OutlineInputBorder()),),
                SizedBox(height: 20,),
                TextField(
                  controller: pincode1,
                  decoration: InputDecoration(labelText: "PINCODE",border: OutlineInputBorder()),),
                SizedBox(height: 20,),
                TextField(
                  controller: email1,
                  decoration: InputDecoration(labelText: "EMAIL",border: OutlineInputBorder()),),
                SizedBox(height: 20,),
                TextField(
                  controller: password1,
                  decoration: InputDecoration(labelText: "PASSWORD",border: OutlineInputBorder()),),
                SizedBox(height: 30,),
                ElevatedButton(onPressed:sendvalue, child: Text("SUBMIT")),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("<-"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
