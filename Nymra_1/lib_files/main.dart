import 'dart:async' show Timer;
import 'package:flutter/material.dart';


import 'Loginscreen.dart';

void main() {
  runApp(MaterialApp(home: Loading(),));
}

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading>
{
  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();

    Timer(
        Duration(seconds: 4), () =>
        Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen()))
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: Colors.white,
        body: Center
          (
            child: Image.asset("asset/loading.gif",height: 350,width: 400,fit: BoxFit.cover,),
          ),

      );
  }
}


