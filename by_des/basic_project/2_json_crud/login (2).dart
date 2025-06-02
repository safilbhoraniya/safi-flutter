import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_18/registration.dart';
import 'package:task_18/second.dart';
class login extends StatefulWidget
{
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login>
{

  String? _mobilenumber;
  String? _password;
  final _formKey = GlobalKey<FormState>();

  late SharedPreferences sharedPreferences;


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar
        (
        title: Text('login screen', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.red[100],
      ),
      body: Center
        (

          child:
          Stack(

            children:
            [
              SingleChildScrollView
                (
                padding: EdgeInsets.all(20),
                child: Form
                  (
                  key: _formKey,
                  child: Column
                    (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [

                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'enter mobile number',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.greenAccent[70],
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter a mobile number";
                          }
                          if (value.length != 10) {
                            return "please enter 10 digits";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _mobilenumber = value;
                        },
                      ),
                      SizedBox(height: 16.0),


                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "enter a password",
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.greenAccent[70]
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter a password';
                          }
                          return null;
                        },
                        obscureText: true,
                        onSaved: (value) {
                          _password = value;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: ElevatedButton(
                          onPressed: _login,
                          child: Text("logg in", style: TextStyle(fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(10)
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: ElevatedButton
                          (
                          onPressed:()
                          {
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => second()));
                          }, child: Text("log in"),
                          

                        ),
                        
                        
                      ),


                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

  void _login()async
  {

    var response = await http.post(Uri.parse("https://safilbhoraniya.000webhostapp.com/task_18/login.php"),body:
    {
      "mobile":_mobilenumber.toString(),
      "password":_password.toString(),

    });
    var data = response;


   }
  }