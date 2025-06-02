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
  Color defaultColor = Colors.white;

  void select (Color color)
  {
    setState(() {
      defaultColor = color;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(centerTitle: true,title: Text("color change switch"),),
      body: Container
        (
          color: defaultColor,
          child: Column
            (
              children:
              [
                SizedBox(height: 20,),
                
                
                RadioListTile
                  (
                    title: Text("blue"),
                    value: Colors.blue,
                    groupValue: defaultColor,
                    onChanged: (value){
                      setState(() {
                        select(Colors.blue);
                      });
                    },
                ),
                RadioListTile
                  (
                    title: Text("pink"),
                    value: Colors.pink,
                    groupValue: defaultColor,
                    onChanged: (value){
                      setState(() {
                        select(Colors.pink);
                      });
                    },
                  ),
                RadioListTile
                  (
                    title: Text("yellow"),
                    value: Colors.yellow,
                    groupValue: defaultColor,
                    onChanged: (value){
                      setState(() {
                        select(Colors.yellow);
                      });
                    },
                  ),
                RadioListTile
                  (
                    title: Text("default color"),
                    value: Colors.white,
                    groupValue: defaultColor,
                    onChanged: (value){
                      setState(() {
                        select(Colors.white);
                      });
                    },
                  )



              ],
            ),
        ),
      );
  }
}


