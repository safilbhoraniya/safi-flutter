import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: myapp(),));
}
class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text("switzerland view"),backgroundColor: Colors.blue,),
      body: Padding(padding: EdgeInsets.all(20.0),
        child: Column
          (
          children:
          [
            Container
              (
              child: Image.asset("assets/switzerland.jpg",height: 300,width: 300,),
              ),
            SizedBox(height: 10,),

            Container(
              child: Padding
                (
                padding: EdgeInsets.only(left: 15.0),
                child: Row
                  (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Column
                      (
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:
                      [
                        Text("Oeschinen Lake Campground",style: TextStyle(fontWeight: FontWeight.w900),),

                        Text("kanderstag,Switzerland")
                      ],
                    ),
                    SizedBox(height: 10,width: 40,),

                    Padding(padding: EdgeInsets.only(right: 15),
                      child: Row
                        (
                        children:
                        [
                          Icon(Icons.star,color: Colors.red),
                          SizedBox(width: 8,),
                          Text("41"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ), SizedBox(height: 10,),
            Container
              (
              child: Row
                (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                [
                  Column
                    (
                    children:
                    [
                      Icon(Icons.call,color: Colors.blue),
                      Text("CALL",style: TextStyle(color: Colors.blue)),
                    ],
                    ),
                  Column
                    (
                    children:
                    [
                      Icon(Icons.send,color: Colors.blue),
                      Text("ROUTE",style: TextStyle(color: Colors.blue)),
                    ],
                    ),
                  Column
                    (
                    children:
                    [
                      Icon(Icons.share,color: Colors.blue),
                      Text("SHARE",style: TextStyle(color: Colors.blue)),
                    ],
                    )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0),
              child: Column
                (
                children:
                [
                  SizedBox(height: 10,),
                Text("Lake Oeschinen lies at the foot of the Bluemlisalp in the "
                  "Bernese Alps.Situated 1,578 meters above sea level, it is one "
                  "of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a "
                  "half-hour walk through pastures and pine forest, leads you to "
                  "the lake, which warms to 20 degress Celsius in the summer.Activities "
                  "enjoyed here include rowing, and riding the summer toboggan run."),
    ],
              )
            ),
          ],
        ),
      ),
    );
  }
}