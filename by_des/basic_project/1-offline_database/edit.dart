import 'package:flutter/material.dart';
import 'package:module_5_assign/model.dart';

class edit extends StatefulWidget
{

  final Function(Perform) onSave;
  final Perform ? task;

  edit({required this.onSave,this.task});

  @override
  State<edit> createState() => _editState();

}

class _editState extends State<edit>
{
  final _formKey = GlobalKey<FormState>();
  late String name1;
  late String desc1;
  late String date1;
  late String time1;
  late int priority1;

  @override
  void initState() {
    super.initState();
    name1 = widget.task?.name ?? '';
    desc1 = widget.task?.desc ?? '';
    date1 = widget.task?.date ?? '';
    time1 = widget.task?.time ?? '';
    priority1 = widget.task?.priority ?? 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(centerTitle: true,title: Text("second screen",style: TextStyle(color: Colors.black,backgroundColor: Colors.red),),),
        backgroundColor: Colors.lightBlueAccent,
        body: Center
          (
            child: SingleChildScrollView
              (
                child: Form
                  (
                    key: _formKey,

                  child: Column
                    (
                    mainAxisAlignment: MainAxisAlignment.center,

                      children:
                      [

                        TextFormField
                          (
                            cursorColor: Colors.lightBlueAccent,
                            //cursorRadius: Radius.circular(2),
                            initialValue: name1,
                            decoration: InputDecoration(hintText: "enter a name"),
                            onSaved: (val) => name1 = val!,
                            validator: (value)
                            {
                              if(value!.isEmpty)
                                {
                                  return "please enter name";
                                }
                              return null;
                            },
                          ),
                        TextFormField
                          (
                            cursorColor: Colors.lightBlueAccent,
                            //cursorRadius: Radius.circular(2),
                            initialValue: desc1,
                            decoration: InputDecoration(hintText: "enter discription"),
                            onSaved: (val) => desc1 =val!,
                            validator: (value)
                            {
                              if(value!.isEmpty)
                                {
                                  return "plese fill the detail";
                                }
                              return null;
                            }
                          ),
                        TextFormField
                          (
                            cursorColor: Colors.lightBlueAccent,
                            //cursorRadius: Radius.circular(2),
                            initialValue: date1,
                            decoration: InputDecoration(hintText: "enter a date"),
                            onSaved: (val) => date1 =val!,
                            validator: (value)
                            {
                              if(value!.isEmpty)
                                {
                                  return "enter date";
                                }
                              return null;
                            }
                          ),
                        TextFormField
                          (
                            cursorColor: Colors.lightBlueAccent,
                            //cursorRadius: Radius.circular(2),
                            initialValue: time1,
                            decoration: InputDecoration(hintText: "enter time"),
                            onSaved: (val) => time1 = val!,
                            validator: (value)
                            {
                              if(value!.isEmpty)
                                {
                                  return "enter time";
                                }
                              return null;

                            }
                          ),
                        DropdownButtonFormField
                          (
                          value: priority1,
                            items:
                            [

                              DropdownMenuItem(child: Text("low"),value: 0,),
                              DropdownMenuItem(child: Text("medium"),value: 1,),
                              DropdownMenuItem(child: Text("high"),value: 2,),

                            ],
                            onChanged: (value)
                              {

                                setState(() {
                                  priority1 = value!;
                                });
                              },decoration: InputDecoration(labelText: "priority"),style: TextStyle(color: Colors.blue,decorationColor: Colors.red),
                        ),
                        SizedBox(height: 20,),

                        MaterialButton(
                          color: Colors.purple.shade50,
                          hoverColor: Colors.red,
                          mouseCursor: MouseCursor.uncontrolled        ,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              widget.onSave(Perform
                                (
                                id: widget.task?.id,
                                name: name1,
                                desc: desc1,
                                date: date1,
                                time: time1,
                                priority: priority1,
                                isCompleted: widget.task?.isCompleted ?? false,
                              ));
                              Navigator.pop(context);
                            }
                          },child: Text("insert",style: TextStyle(color: Colors.blue),),
                        ),


                      ],
                    ),
                  ),
              ),
          ),
      );
  }
}
