import 'package:flutter/material.dart';

class project extends StatefulWidget {
  const project({super.key});

  @override
  State<project> createState() => _projectState();
}

class _projectState extends State<project>
{


  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(backgroundColor: Colors.greenAccent,),
        backgroundColor: Colors.green.shade100,
        body: Center
          (
            child: Column
              (
                children:
                [
                  Image.network("https://i.gifer.com/origin/49/49a2ed99a6a46314b6e71c4285a4c0bd_w200.gif",height: 500,width: 500,),
                  SizedBox(height: 20,),
                  Text("Premium Project Page",style: TextStyle(fontSize: 30,color: Colors.black87,backgroundColor: Colors.greenAccent),)
                  

                ],
              ),


          ),
      );
  }
}
