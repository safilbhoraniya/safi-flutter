import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:project_123/admin/admin_dashboard.dart';
import 'package:project_123/mycolors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login.dart';
import 'category.dart';

class AdminHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdminHomePage();
  }
}

class AdminHomePage extends State<AdminHome> {
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
    return RefreshIndicator(
      onRefresh: () async {
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                pageBuilder: (a, b, c) => AdminDashboardScreen(),
                transitionDuration: Duration(seconds: 3)));
        ;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appbarcolor,
          actions: [
            IconButton(
                onPressed: () {
                  sharedPreferences.setBool('projectadmin', true);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: FutureBuilder<List>(
          future: viewCategoryData(),
          builder: (ctx, ss) {
            if (ss.hasData) {
              return Items(list: ss.data!!);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class Items extends StatefulWidget {
  List list;
  Items({required this.list});

  @override
  State<StatefulWidget> createState() {
    return _Items(list_: list);
  }
}

class _Items extends State<Items> {
  late List list_;
  _Items({required this.list_});

  var size;

  var update_category = TextEditingController();

  // late PickedFile _imageFile;
  //final String uploadUrl =
  // "https://topsapi.000webhostapp.com/flutter_project_morning/Upload_category/upload_category_main_image_update.php";
  //final ImagePicker _picker = ImagePicker();

  // void _pickImage(var id) async {
  //   try {
  //     // final pickedFile = await _picker.getImage(source: ImageSource.gallery);
  //
  //     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //     setState(() {
  //       _imageFile = pickedFile as PickedFile;
  //     });
  //   } catch (e) {
  //     print("Image picker error " + e.toString());
  //   }
  //   await uploadImage(_imageFile.path, uploadUrl + "?id=" + id.toString());
  // }

  Future<String?> uploadImage(filepath, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files
        .add(await http.MultipartFile.fromPath('profile_pic', filepath));
    var res = await request.send();
    return res.reasonPhrase;
  }

  void deleteCategory(var id) {
    var url =
        "https://topstech8.000webhostapp.com/Morning_Batch/API/category_delete.php";
    http.post(Uri.parse(url), body: {
      'data': id,
    });
  }

  void deleteCategoryImages(var id) {
    var url =
        "https://topstech8.000webhostapp.com/Ewishes/Category/category_delete.php";
    http.post(Uri.parse(url), body: {
      'data': id,
    });
  }

  void updateCategoryName(var id) {
    var url =
        "https://topstech8.000webhostapp.com/Morning_Batch/API/category_update.php";
    http.post(Uri.parse(url), body: {
      'id': id,
      'category_name': update_category.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: list_.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.blueGrey,
          shadowColor: Colors.blueGrey,
          elevation: 3,
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AdminCategory(
                      index: list_[index]['id'],
                      category_name: list_[index]['category_name'])));
            },
            leading: Icon(
              Icons.list,
              color: Colors.white,
            ),
            trailing: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: Colors.blueGrey,
                    title: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.blueGrey,
                        ),
                        Text(
                          "\tDelete",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    content: Text("This items will be permanently deleted.",
                        style: TextStyle(
                            color: Colors.black, fontStyle: FontStyle.italic)),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Cancel",
                            style: TextStyle(color: Colors.black)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          deleteCategory(list_[index]['id']);
                          deleteCategoryImages(list_[index]['id']);
                          Fluttertoast.showToast(
                              msg: "Category Deleted Successfully",
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 1);
                          Navigator.of(context).pop();
                        },
                        child: Text("Delete",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                );
              },
              child: Icon(
                Icons.delete,
                size: 25,
                color: Colors.white,
              ),
            ),
            title: Row(
              children: [
                SizedBox(
                  width: size.width * 55 / 100,
                  child: Text("${list_[index]['category_name']}".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 15)),
                ),
                InkWell(
                  onTap: () {
                    update_category.text = list_[index]['category_name'];
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: Colors.blueGrey,
                        title: Row(
                          children: [
                            Icon(
                              Icons.update,
                              color: Colors.white,
                            ),
                            Text("\tUpdate Category",
                                style: TextStyle(color: Colors.black))
                          ],
                        ),
                        content: Container(
                          height: size.height * 14 / 100,
                          child: Column(
                            children: [
                              TextField(
                                controller: update_category,
                                decoration: InputDecoration(
                                  hintText: "Input Category Name",
                                ),
                              ),
                              SizedBox(height: size.height * 1 / 100),
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: double.infinity,
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                    padding: const EdgeInsets.all(16.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    // _pickImage(list_[index]['id']);
                                  },
                                  child: Text(
                                    "Update Image".toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("Cancel",
                                style: TextStyle(color: Colors.black)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (!update_category.text.isEmpty) {
                                updateCategoryName(list_[index]['id']);
                                Fluttertoast.showToast(
                                    msg: "Category Updated Successfully",
                                    toastLength: Toast.LENGTH_LONG,
                                    timeInSecForIosWeb: 1);
                                Navigator.of(context).pop();
                              } else {
                                if (update_category.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please Input Category Name",
                                      toastLength: Toast.LENGTH_LONG,
                                      timeInSecForIosWeb: 1);
                                }
                              }
                            },
                            child: Text("Update",
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Icon(Icons.edit, size: 25, color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}