import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(home: myapp()));
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  TextEditingController number = TextEditingController();
  String _reversedNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("reverse number"),backgroundColor: Colors.blue),
      body:  Center
        (
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text("reverse number",style: TextStyle(color: Colors.lightBlueAccent),),
            Image.asset("asset/reverse.jpg",height: 300,width: 300,),
            SizedBox(height: 20,),
            TextField
              (
              controller: number,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "enter a number",border: OutlineInputBorder(), ),
              ),
            SizedBox(height: 15,),
            ElevatedButton
              (
              onPressed: _reverseNumber,
              child: Text("revers",style: TextStyle(color: Colors.blue),),
              ),
            SizedBox(height: 20.0),
            Text("reverse : $_reversedNumber",
              style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _reverseNumber()
  {

    String input = number.text;
    if (input.isNotEmpty)
    {
      int? number = int.tryParse(input);
      if (number != null)
      {

        String reversed = number.toString().split("").reversed.join();
        setState(() {
          _reversedNumber = reversed;
        }
        );
      }
    } else
    {
      setState(() {
        _reversedNumber = " ";
      });
    }
  }
}