import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        backgroundColor: Colors.greenAccent.shade100,
        appBar: AppBar(title: Text("Settings"),backgroundColor: Colors.greenAccent,centerTitle: true,),
        body: Center
          (

          ),
      );
  }
}
