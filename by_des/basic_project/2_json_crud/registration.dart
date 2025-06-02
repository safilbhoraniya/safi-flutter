
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_18/main.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second>
{
  TextEditingController name = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();

  void _insertdata()
  {
    var url = Uri.parse("https://safilbhoraniya.000webhostapp.com/task_18/signup.php");
    http.post(url,body:
    {
      "name":name.text.toString(),
      "lname":lname.text.toString(),
      "email":email.text.toString(),
      "mobile":mobile.text.toString(),
      "password":password.text.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(centerTitle: true,title: Text("registration screen"),),
      backgroundColor: Colors.deepOrangeAccent,
      body: Center
        (
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Container(color: Colors.cyan,padding: EdgeInsets.all(10),margin: EdgeInsets.all(10),
                child: Column
                  (
                 children:
                 [
            
            
            TextFormField
              (
              decoration: InputDecoration(
                hintText: "enter your fisrt name",
                border: OutlineInputBorder(),

                fillColor: Colors.cyan,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter a first name";
                }
                return null;
              },
            ),

            
            TextFormField(
              controller: lname,
              decoration: InputDecoration(
                hintText:"enter last name",
                border: OutlineInputBorder(),
                fillColor: Colors.cyan,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter last name";
                }
                return null;
              },
            ),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                hintText: "enter your email id",
                border: OutlineInputBorder(),

                fillColor: Colors.cyan,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter your email";
                }
                return null;
              },
            ),
            TextFormField(
              controller: mobile,
              decoration: InputDecoration(
                hintText: "enter your mobile no",
                border: OutlineInputBorder(),
                fillColor: Colors.cyan,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter your mobile no";
                }
                return null;
              },
            ),
            TextFormField(
              controller: password,
              decoration: InputDecoration
                (
                hintText: "enter a password",
                border: OutlineInputBorder(),
                fillColor: Colors.cyan,
                ),
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter your password";
                }
                return null;
              },
            ),
                 ])),



            ElevatedButton(onPressed: ()
            {
              _insertdata();
              print("insertted");
              Navigator.push(context, MaterialPageRoute(builder: (context) => myapp()));
            }, child: Text("add"))

          ],
        ),
      ),
    );
  }
}
