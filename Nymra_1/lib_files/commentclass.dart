import 'package:flutter/material.dart';

class commentclass extends StatefulWidget {
  const commentclass({super.key});

  @override
  State<commentclass> createState() => _commentclassState();
}

class _commentclassState extends State<commentclass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
         body: Column
           (
           children:
           [
             Padding
               (
               padding: EdgeInsets.only(top: 40,left: 70),
               child: Text("Comments",style: TextStyle(fontSize: 25,color: Colors.blue),),
               ),
           ],
            ),
      );
  }
}
