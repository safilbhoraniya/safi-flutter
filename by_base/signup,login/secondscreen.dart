import 'package:assignment_59/login.dart';
import 'package:assignment_59/main.dart';
import 'package:flutter/material.dart';

class secondscreen extends StatefulWidget {
  const secondscreen({super.key});

  @override
  State<secondscreen> createState() => _secondscreenState();
}

class _secondscreenState extends State<secondscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("second screen",style: TextStyle(color: Colors.red,backgroundColor: Colors.blue),),),
      body: Center
        (
         child: Row
           (
            children:
            [
              ElevatedButton(onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                  }

                  , child: Text("login")),
              ElevatedButton(onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => myapp()));
                  }, child: Text("registration"))
            ],
           ),
        ),
    );
  }
}
