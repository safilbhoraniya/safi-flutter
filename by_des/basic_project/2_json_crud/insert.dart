import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_18/adddata.dart';


class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add>
{
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quality = TextEditingController();

  void _insertdata()
  {

    var url = Uri.parse("https://safilbhoraniya.000webhostapp.com/studsApi/insert.php");
    http.post(url,body:
    {
      "name":name.text.toString(),
      "price":price.text.toString(),
      "quality":quality.text.toString()


    });

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("add data page"),),
      body: Center
        (
        child: Column
          (
          children:
          [
            TextFormField(controller: name,decoration: InputDecoration(hintText: "enter Your product name"),),
            SizedBox(height: 10,),
            TextFormField(controller: price,decoration: InputDecoration(hintText: "enter Your product price"),),
            SizedBox(height: 10,),
            TextFormField(controller: quality,decoration: InputDecoration(hintText: "enter Your product's quality"),),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()
            {
              _insertdata();
              print("Inserted");
              Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()));



            }, child: Text("Insert"))
          ],
        ),
      ),



    );
  }
}