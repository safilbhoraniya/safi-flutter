import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_123/login.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    //return MaterialApp(home: splash(),);
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
        future: _initialization,
        builder:( context,snapshot)
        {
          if(snapshot.connectionState == ConnectionState.done)
          {
            return MaterialApp
              (
              home: splash(),
              debugShowCheckedModeBanner: false,
            );
          }
          if(snapshot.hasError)
          {
            print('Something Went Wrong');
          }

          return CircularProgressIndicator();
        });
  }
}

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        Duration(seconds: 8), () =>
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()))
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: Center(
        child: Lottie.network('https://jenil2703.000webhostapp.com/API_project_1/splash.json',height: 250,width: 250),
      ),
    );
  }
}


