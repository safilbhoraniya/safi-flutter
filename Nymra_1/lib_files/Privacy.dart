import 'package:flutter/material.dart';

class Privacy extends StatefulWidget
{
  String email2;
  String password2;

  Privacy({super.key,required this.email2,required this.password2});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(title: Text("Privacy"),backgroundColor: Colors.greenAccent,centerTitle: true,),
        backgroundColor: Colors.greenAccent.shade100,
        body: Column
          (
            children:
            [
              SizedBox(height: 10,),
              Text("_____________________________________________________",style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),

              Row
                (
                  children:
                  [
                    SizedBox(width: 10,),
                    Icon(Icons.person),
                    SizedBox(width: 10,),
                    Text("Show Password",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 30),)
                  ]
              ),
              Text(""),

              Padding
                (
                padding: const EdgeInsets.all(8.0),
                child: ListTile
                  (
                    leading: Icon(Icons.security),
                    title: Text("Password And Seurity"),
                    tileColor: Colors.greenAccent,
                    hoverColor: Colors.yellow,
                    splashColor: Colors.blue,

                    
                    onTap: ()
                    {
                       simplealertdialogue(context);

                    },
                  ),
                
              ),
              SizedBox(height: 20,),
              Text("Other Security Settings",style: TextStyle(color: Colors.black,fontSize: 20),)
            ],
          ),
      );
  }

  void simplealertdialogue(BuildContext context)
  {

    Widget okButton = ElevatedButton
      (
      child: Text("OK"),
      onPressed: ()
      {
        Navigator.of(context).pop();
      },
    );


    AlertDialog alert = AlertDialog
      (
      backgroundColor: Colors.greenAccent.shade100,
      title: Text("Your Email is : ${widget.email2}",style: TextStyle(color: Colors.black,fontSize: 20),),
      content: Text("Security Password is : ${widget.password2}",style: TextStyle(color: Colors.black,fontSize: 15),),

      actions:
      [

        okButton,
      ],
    );
    showDialog
      (
     // barrierColor: Colors.greenAccent,
      context: context,
      builder: (BuildContext context)
      {
        return alert;
      },
    );



  }

}
