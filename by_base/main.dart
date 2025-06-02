import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: myapp(),debugShowCheckedModeBanner: false,));
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {

  TextEditingController num1= TextEditingController();
  TextEditingController num2= TextEditingController();
  List<int> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text("between number"),backgroundColor: Colors.blueGrey,),
       body: Center
        (
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Image.asset("asset/images.png",height: 100,),
            Text("between number",style: TextStyle(color: Colors.lightBlueAccent),),
            SizedBox(height: 20,width: 20,),
            TextFormField(controller: num1,decoration: InputDecoration(label: Text("enter a number"),border: OutlineInputBorder(),prefixIcon: Icon(Icons.numbers)),),
            SizedBox(height: 20,),
            TextFormField(controller: num2,decoration: InputDecoration(label: Text("enter second number"),border: OutlineInputBorder(),prefixIcon: Icon(Icons.numbers)),),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: ()
            {
              setState(() {
                integer();
              });
            }, child: Text("ok",style: TextStyle(backgroundColor: Colors.blue,color: Colors.black),)),
            SizedBox(height: 20),
            Text("${list.toString()}",style: TextStyle(color: Colors.blue,backgroundColor: Colors.red),)

          ],
        ),
      ),
    );
  }
  void integer() {
    list.clear();
    var first = int.parse(num1.text);
    var second = int.parse(num2.text);
    for (int i = first + 1; i < second; i++)
    {
      list.add(i);
    }
  }
}
