import 'package:assignment_59/secondscreen.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login>
{
  final _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(centerTitle: true,title: Text("login-page",style: TextStyle(color: Colors.black,backgroundColor: Colors.blueAccent)),),
        backgroundColor: Colors.greenAccent,
        body: Center
          (
            child: Column
              (
              mainAxisAlignment: MainAxisAlignment.center,
                children:
                [

                  Image.asset("asset/login.gif",height: 200,width: 200,),
                  TextFormField
                    (
                      controller: email,
                      decoration: InputDecoration(hintText: "enter your email"),
                      validator: (value)
                      {

                          if(value!.isEmpty)
                            {
                              return "please enter your email";
                            }
                          return null;
                      },
                    ),
                  SizedBox(height: 50,),
                  TextFormField
                    (
                      controller: password,
                      decoration: InputDecoration(hintText: "enter your password"),
                      validator: (value)
                      {
                        if(value!.isEmpty)
                          {
                            return "please enter a password";
                          }
                        return null;
                      }
                    ),
                  SizedBox(height: 30,width: 30,),
                  ElevatedButton(onPressed: ()
                      {
                        if(_formkey.currentState!.validate()) {
                          String email1 = email.text.toString();
                          String password1 = password.text.toString();

                          if (email1 == "@gmail.com" && password1 == "1234") {
                            print("login succesfully");
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => secondscreen()));
                          }
                        }
                      }, child: Text("login here"))
                ],
              ) ,
          )  ,
      );
  }
}
