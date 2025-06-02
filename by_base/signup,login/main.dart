

import 'package:assignment_59/login.dart';
import 'package:assignment_59/secondscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: myapp(),));
}
class myapp extends StatefulWidget
{
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp>
{
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(centerTitle: true,title: Text("registration from",style: TextStyle(backgroundColor: Colors.blue),),),
        backgroundColor: Colors.lightGreen,
        body: Center
          (
            child: Column
              (
              mainAxisAlignment: MainAxisAlignment.center,
               children:
               [

                 SizedBox(height: 10,width: 10,),
                 Image.asset("asset/registration.gif",height: 200,width: 200,),
                 SizedBox(height: 10,),
                 TextFormField
                   (
                   controller: name,
                   decoration: InputDecoration(hintText:"enter your name"),
                   validator: (value)
                     {
                       if(value!.isEmpty)
                         {
                           return "plaese enter a name";
                         }
                       return null;
                     },
                 ),
                 SizedBox(height: 20,width: 20,),
                 TextFormField
                   (
                    controller: email,
                    decoration: InputDecoration(hintText: "enter your email id"),
                    validator: (value)
                     {
                       if(value!.isEmpty)
                         {
                           return "please enter a email";
                         }
                       return null;
                     },
                   ),
                 SizedBox(height: 20,width: 20,),
                 TextFormField
                   (
                    controller: password,
                    decoration: InputDecoration(hintText: "enter a password"),
                    validator: (value)
                     {
                       if(value!.isEmpty)
                         {
                           return "please enter a password";
                         }
                       return null;
                     },
                   ),
                 SizedBox(height: 30,width: 30,),

                 ElevatedButton(onPressed: ()
                     {
                       if(_formKey.currentState!.validate())
                         {
                           String name1 = name.text.toString();
                           String email1 =email.text.toString();
                           String password1 = password.text.toString();

                           if(name1 == "name" && email1 == "@gmail.com" && password1 == "1234" )
                           {
                             print("registration succesful");
                             Navigator.push(context, MaterialPageRoute(builder: (context) => secondscreen()));
                           }
                         }

                     }, child: Text("registration here")),
                 

                 SizedBox(height: 30,),
                 ElevatedButton(onPressed: ()
                     {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                     },
                       child: Text("login"))
                       ]

              ),
          ),
      );
  }
}
