import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_18/insert.dart';
import 'package:task_18/model.dart';

class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{

  Future<List> getdata()async
  {
    var url = Uri.parse("https://safilbhoraniya.000webhostapp.com/studsApi/view.php");
    var resp = await http.get(url);
    return jsonDecode(resp.body);
  }

  Future<List> pullrefresh()async
  {
    var url = Uri.parse("https://safilbhoraniya.000webhostapp.com/studsApi/view.php");
    var resp = await http.get(url);
    return jsonDecode(resp.body);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Json Crud App"),),
      body: RefreshIndicator(
        onRefresh: pullrefresh,
        child: Container
          (
          color: Colors.pink.shade100,
          child: FutureBuilder<List>
            (
            future: getdata(),
            builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot)
            {
              if(snapshot.hasData)
              {

                return Model(list:snapshot.data!!);
              }
              if(snapshot.hasError)
              {
                print('Network Not Found');
              }
              return Container
                (
                  color: Colors.blue,
                  child: Column
                    (
                      children:
                      [
                        Text(""),
                      ],
                    ),
                );
            },),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          Navigator.push(context,MaterialPageRoute(builder: (context) => add()));
        },
        child: Text("add your list data"),
      ),);

  }




}