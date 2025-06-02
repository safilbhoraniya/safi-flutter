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
  double red = 0;
  double green = 0;
  double blue = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(centerTitle: true,title: Text("color-slider",style: TextStyle(color: Colors.blue),),),
        body: Container
          (
            color: Color.fromRGBO(red.round(), green.round(), blue.round(), 1),
            child: Column
              (
                mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Image.asset("asset/ColorSlider.gif",height: 200,width: 200,),
                Text("red color",style: TextStyle(color: Colors.white),),
                Slider
                  (
                    min: 0,
                    max: 100,
                    value: red,
                    onChanged: (value)
                    {
                      setState(() {
                        red = value;
                      });
                    }
                  ),
                Text("blue color",style: TextStyle(color: Colors.white),),
                Slider
                  (
                    min: 0,
                    max: 100,
                    value: blue,
                    onChanged: (value)
                    {
                      setState(() {
                        blue = value;
                      });
                    }
                ),
                Text("green color",style: TextStyle(color: Colors.blue),),
                Slider
                  (
                    min: 0,
                    max: 100,
                    value: green,
                    onChanged: (value)
                    {
                      setState(() {
                        green = value;
                      });
                    }
                )
              ],
              ),
          ),
       

      );
  }
}

