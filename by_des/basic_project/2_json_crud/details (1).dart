import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_18/adddata.dart';

class details extends StatefulWidget
{
  late List list;
  late int index;

  details({required this.list,required this.index});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Update"),),
      body: Center
        (
        child: Column
          (
          children:
          [
            Text(
              widget.list[widget.index]['name'],
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.list[widget.index]['price'],
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.list[widget.index]['quality'],
              style: TextStyle(fontSize: 20.0),
            ),


            MaterialButton(
                child: Text("Delete"),
                color: Colors.deepPurpleAccent,
                onPressed: ()
                {
                  confirm();
                }
            )
          ],
        ),
      ),
    );
  }

  void confirm()
  {
    var url = "https://safilbhoraniya.000webhostapp.com/studsApi/delete.php";
    http.post(Uri.parse(url),body:
    {
      'id':widget.list[widget.index]['id'],

    });
    Navigator.of(context).push
      (MaterialPageRoute(builder: (BuildContext context)=> MyApp()));
  }
}
