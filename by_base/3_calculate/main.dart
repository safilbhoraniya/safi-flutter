import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

enum Operator {addition,substraction,multiplication,divison}

class _MyAppState extends State<MyApp> {

  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  double ans = 0;
  String operation='';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("between numbers"),backgroundColor: Colors.cyan,),
      body: Center
        (
        child: SingleChildScrollView(
          child: Column
            (
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Text("additon,substraction,multiplicaton,divison",style: TextStyle(color: Colors.blue),),
              Image.asset("asset/calc.jpg",height: 100,width: 500,),
              SizedBox(height: 20,),
              TextFormField(controller: num1,decoration: InputDecoration(label: Text("enter a number"),border: OutlineInputBorder(),),keyboardType: TextInputType.number,),
              SizedBox(height: 20,),
              TextFormField(controller: num2,decoration: InputDecoration(label: Text("enter second number"),border: OutlineInputBorder(),),keyboardType: TextInputType.number,),
              SizedBox(height: 20,),

              RadioListTile
                (
                  title: Text("addition"),
                  value: 'additon',
                  groupValue: operation,
                  onChanged: (value)
                  {
                    setState(() {
                      operation = value!;
                    });
                  }),
              RadioListTile(
                  title: Text("substraction"),
                  value: 'substraction',
                  groupValue: operation,
                  onChanged: (value)
                  {
                    setState(() {
                      operation = value!;
                    });
                  }),
              RadioListTile(
                  title: Text("multiplication"),
                  value: 'multiplication',
                  groupValue: operation,
                  onChanged: (value)
                  {
                    setState(() {
                      operation = value!;
                    });
                  }),
              RadioListTile(
                  title: Text("division"),
                  value: 'divison',
                  groupValue: operation,
                  onChanged: (value)
                  {
                    setState(() {
                      operation = value!;
                    });
                  }),

              SizedBox(height: 20,),

              ElevatedButton(onPressed: ()
              {
                Result();
              }, child: Text("calculate",style: TextStyle(color: Colors.blue),)),
              SizedBox(height: 20,),
              Text('answer is : $ans',style: TextStyle(color: Colors.black,backgroundColor: Colors.tealAccent),)

            ],

          ),
        ),
      ),
    );
  }
  void Result()
  {
    double n1 = double.tryParse(num1.text) ?? 0;
    double n2 = double.tryParse(num2.text) ?? 0;

    setState(() {
      switch(operation)
      {
        case 'addition' :
          ans = n1 + n2;
          break;
        case 'substraction' :
          ans = n1 - n2;
          break;
        case 'multiplication' :
          ans = n1 * n2;
          break;
        case 'divison' :
          ans = n1 / n2;
          break;
        default :
          ans = 0;
          break;
      }
    });
  }
}

