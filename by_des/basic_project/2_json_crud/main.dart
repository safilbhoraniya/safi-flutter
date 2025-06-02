
import 'package:flutter/material.dart';
import 'package:task_18/login.dart';
import 'package:task_18/registration.dart';



void main()
{
  runApp(MaterialApp(home: myapp(),));
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(centerTitle: true,title: Text("crud app",style: TextStyle(color: Colors.black,backgroundColor: Colors.blueGrey),),),
      body: Center
        (
        child: Column
          (
          children:
          [
            ElevatedButton(onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
            }, child: Text("login-page"),),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => second()));
            }, child: Text("registration"))
          ],
        ),
      ),


    );
  }
}

