import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_5_assign/edit.dart';
import 'package:module_5_assign/model.dart';
import 'package:module_5_assign/dbhelper.dart';

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
  int index = 0;
  List<Perform> tasks =[];
  final db = dbHelper();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    list();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
         appBar: AppBar(centerTitle: true,title: Text("task list app",style: TextStyle(color: Colors.black,backgroundColor: Colors.blue),),),
      body: Center
        (

          child: ListView.builder
            (




              itemBuilder: (context,index)
                  {
                    Perform task = tasks[index];
                    return Card
                      (
                      color: task.isCompleted ? Colors.greenAccent : Colors.blue,
                      child:ListTile
                        (
                        title: Row
                          (
                          children:
                          [
                            Text("name"),
                            Text(task.name,style: TextStyle(decorationColor: Colors.lightGreen,decoration: task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none),),

                          ],
                        ),
                        subtitle: Column
                          (
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                          [
                            Text('desc : ${task.desc}'),
                            Text('date ${task.date}'),
                            Text('time ${task.time}'),
                            Text('priority ${priority(task.priority)}',style: TextStyle(color: prioritycolor(task.priority)),),

                          ],
                        ),
                        trailing: Row
                          (
                          mainAxisSize: MainAxisSize.min,
                          children:
                          [
                            IconButton
                              (
                                icon: Icon(Icons.edit),
                                onPressed: ()

                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => edit(onSave: (updatetask)
                                  {
                                    db.update(updatetask);
                                    list();
                                  },task:task,
                                  ),),);
                                }
                              ),
                            IconButton
                              (
                                icon: Icon(Icons.delete),
                                onPressed: ()
                                {
                                  delete(task.id!);
                                  Navigator.of(context).pop();
                                },
                              ),



                          ],
                        ),
                        //contentPadding: EdgeInsets.all(10),
                        iconColor: Colors.red,
                        onLongPress: ()
                          {
                            setState(() {
                              task.isCompleted = true;

                            });db.update(task);
                            Navigator.of(context).pop();
                          }

                      ),

                    );

                  }

            ),


        ),
      floatingActionButton: FloatingActionButton
        (
          hoverColor: Colors.cyan,
          mouseCursor: MouseCursor.defer,
          //   focusColor: Colors.yellow,
          onPressed: ()
              {



                Navigator.push(context, MaterialPageRoute(builder: (context) => edit(onSave:(task)
                {

                  db.insert(task);
                  list();

                })));

              }, child: Icon(Icons.add),

        ),
      );

  }
  String priority(int priority) {
    switch (priority) {
      case 0:
        return 'low';
      case 1:
        return 'average';
      case 2:
        return 'high';
      default:
        return '';
    }
  }
  list() async
  {
    List<Perform> x = await db.get();
    setState(() {
      tasks = x;
    });
  }
  delete(int id) async {
    await db.delete(id);
    list();
  }

  Color prioritycolor(int priority)
  {
    switch (priority)
    {
      case 0:
        return Colors.green;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.red;
      default :
        return Colors.black;
    }
  }

}
























