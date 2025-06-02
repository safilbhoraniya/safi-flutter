
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  Color whitecolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(centerTitle: true,title: Text("backround color change"),),
        body: Container
          (
          color: whitecolor,
            child: Column
              (


                children:
                [
                  Image.asset("asset/color1.jpg",height: 200,),
                  SizedBox(height: 10,),
                  Image.asset("asset/teal.png",height: 50,),
                  RadioListTile
                    (

                      title: Text("tealaccent"),
                      value: Colors.tealAccent,
                      groupValue: whitecolor,
                      onChanged: (value)
                      {
                        setState(() {
                          color(Colors.tealAccent);
                        });
                      }
                  ),
                  SizedBox(height: 10,),
                  Image.asset("asset/black.jpg",height: 50,),
                  RadioListTile
                    (
                      title: Text("black"),
                      value: Colors.black,
                      groupValue: whitecolor,
                      onChanged: (value)
                      {
                        setState(() {
                          color(Colors.black);
                        });
                      }
                  ),
                  SizedBox(height: 10,),
                  Image.asset("asset/yellow.jpg",height: 50,),
                  RadioListTile
                    (
                      title: Text("yello"),
                      value: Colors.yellow,
                      groupValue: whitecolor,
                      onChanged: (value)
                      {
                        setState(() {
                          color(Colors.yellow);
                        });
                      }
                  ),
                ],
              )
          ),

      );

  }

  void color(Color color)
  {
    setState(() {
      color = Colors.black;
    });
  }
}
