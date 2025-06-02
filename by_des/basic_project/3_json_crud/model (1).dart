import 'package:flutter/material.dart';
import 'package:task_18/details.dart';

class Model extends StatelessWidget
{
  late List list;

  Model({required this.list});

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder
      (
        itemCount: list.length,
        itemBuilder: (context,i)
        {
          return ListTile
            (
            title:
            Column(
              children:
              [
                Container(
                  color: Colors.pink.shade100,
                  padding: EdgeInsets.all(30),
                child: SingleChildScrollView(
                child: Column(

                children: [

              Text(list[i]["name"],style: TextStyle(fontWeight: FontWeight.bold),),
              Text(list[i]["price"]),
              Text(list[i]["quality"]),
            ]))),
                SizedBox(height: 30,),
                Container
                  (
                  padding: EdgeInsets.all(10),
                  color: Colors.greenAccent,
                  child: Text("-_______________________________________-"),
                  )

              ],),

            onTap: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => details(list:list,index:i)));
              Navigator.of(context).pop();
            },
          );
        });
  }


}