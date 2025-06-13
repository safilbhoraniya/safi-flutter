import 'package:flutter/material.dart';

class userprofile extends StatefulWidget {
  const userprofile({super.key});

  @override
  State<userprofile> createState() => _userprofileState();
}

class _userprofileState extends State<userprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        backgroundColor: Colors.greenAccent.shade100,

        appBar: AppBar(title: Text("Profile page"),backgroundColor: Colors.greenAccent,),
        body: Center
          (
            child: Column
              (
               children:
               [
                 Text("welcome To user Profile page",),

               ],
              ),
          ),
      );
  }
}
