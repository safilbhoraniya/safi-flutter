import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_123/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'usercategory.dart';

class UserDashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserDashboardScreen2();
  }
}

class UserDashboardScreen2 extends State<UserDashboardScreen> {
  var size;
  late SharedPreferences sharedPreferences;
  late String mob;

  Future<List> viewCategoryData() async {
    final responce = await http.get(Uri.parse(
        "https://safilbhoraniya.000webhostapp.com/project-123/category_view.php"));
    return jsonDecode(responce.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    initial();
  }

  void initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      mob = sharedPreferences.getString('mob')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Welcome"),
        actions: [
          IconButton(
              onPressed: () {
                sharedPreferences.setBool('project', true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<List>(
        future: viewCategoryData(),
        builder: (ctx, ss) {
          if (ss.hasData) {
            return Items(list: ss.data!, size: size);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  List list;
  var size;
  Items({required this.list, this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          size.width * 2.5 / 100,
          size.height * 1.2 / 100,
          size.width * 3 / 100,
          size.height * 1.2 / 100),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.8 / 100),
          Expanded(
            child: GridView.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 7,
              crossAxisCount: 2,
              children: List.generate(list.length, (index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Category(
                            index: list[index]['id'],
                            category_name: list[index]['category_name'])));
                  },
                  child: Card(
                    elevation: 3,
                    shadowColor: Colors.amber,
                    color: Colors.blueGrey,
                    child: Column(
                      children: [
                        Container(
                          child: Image.network(
                            list[index]['category_img'],
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return SizedBox(
                                height: size.height * 16.3 / 95,
                                child: Center(
                                  child: Icon(
                                    Icons.error,
                                    size: 40,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                ),
                              );
                            },
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return SizedBox(
                                height: size.height * 16.3 / 95,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                        null
                                        ? loadingProgress
                                        .cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                ),
                              );
                            },
                            height: size.height * 16.3 / 95,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, size.height * 1.3 / 260, 0, 0),
                          child: Center(
                            child: Text(
                                "${list[index]['category_name']}".toUpperCase(),
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15,
                                    color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}