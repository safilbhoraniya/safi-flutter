import 'package:flutter/material.dart';
import 'package:task_18/adddata.dart';

class detailscreen extends StatefulWidget {
  const detailscreen({super.key});

  @override
  State<detailscreen> createState() => _detailscreenState();
}

class _detailscreenState extends State<detailscreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold
      (
        appBar: AppBar(centerTitle: true,title: Text("detail screen",style: TextStyle(color: Colors.black),),),
        body: Center
          (
            child: Column
              (
                children:
                [
                  Container
                    (
                    padding: EdgeInsets.all(30),
                    color: Colors.indigo[100],
                      child: Column
                        (
                          children:
                          [
                            Text("----you can add data for some list ---"),
                            Positioned.fill
                              (
                                child: Container
                                  (

                                  padding: EdgeInsets.all(20),
                                    color: Colors.blue[100],
                                    child: Column
                                      (
                                        children:
                                        [
                                          Text("--> for exmple <--"),
                                          Text("list -- 1")
                                        ],
                                      )
                                  ),

                              ),

                          ],
                        ),
                    ),
                  SizedBox(height: 50,),
                  Container
                    (
                      color: Colors.blue,
                      padding: EdgeInsets.all(20),
                      child: Column
                        (
                          children:
                          [
                            MaterialButton(onPressed: () =>
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()))
                                }, child: Text("add data",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
                          ],
                        ),
                    )

                ],
              )

          ),
      );
  }
}
