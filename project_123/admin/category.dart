import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:project_123/admin/admin_dashboard.dart';
import 'package:project_123/mycolors.dart';


class AdminCategory extends StatefulWidget {
  var index;
  var category_name;
  AdminCategory({Key? key, @required this.index, @required this.category_name})
      : super(key: key);

  @override
  AdminCategoryPage createState() =>
      AdminCategoryPage(category_id: index, category_nm: category_name);
}

class AdminCategoryPage extends State<AdminCategory> {
  var size;

  var category_id;
  var category_nm;
  AdminCategoryPage(
      {Key? key, @required this.category_id, @required this.category_nm});

  Future<List> viewCategoryItemsData() async {
    final responce = await http.get(Uri.parse(
        "https://topstech8.000webhostapp.com/Morning_Batch/API/category_images_view.php?data=" +
            category_id.toString()));
    return jsonDecode(responce.body);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("${category_nm}".toUpperCase(),
            style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
        backgroundColor: appbarcolor,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List>(
                future: viewCategoryItemsData(),
                builder: (ctx, ss) {
                  if (ss.hasData) {
                    return Items(list: ss.data!!, size: size);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  List list;
  var size;
  Items({required this.list, this.size});

  void deleteCategoryImages(var id) {
    var url =
        "https://safilbhoraniya.000webhostapp.com/project-123/category_delete.php";
    http.post(Uri.parse(url), body: {
      'data': id,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 1,
        crossAxisCount: 2,
        children: List.generate(list.length, (index) {
          return Column(
            children: [
              Image.network(
                list[index]['c_images'],
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return SizedBox(
                    height: size.height * 17.4 / 100,
                    child: Center(
                      child: Icon(
                        Icons.error,
                        size: 40,
                        color: Colors.red,
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
                    height: size.height * 17.4 / 100,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!!
                            : null,
                      ),
                    ),
                  );
                },
                height: size.height * 17.4 / 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: size.height * 5 / 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: ElevatedButton(
                  child: Text("Delete".toUpperCase(),
                      style: TextStyle(
                          color: Colors.blueGrey, fontStyle: FontStyle.italic)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: Colors.blueGrey,
                        title: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            Text(
                              "\tDelete",
                              style: TextStyle(color: Colors.blueGrey),
                            )
                          ],
                        ),
                        content: Text("This image will be permanently deleted",
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic)),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("Cancel",
                                style: TextStyle(color: Colors.lightBlue)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              deleteCategoryImages(list[index]['id']);
                              Fluttertoast.showToast(
                                  msg: "Image deleted Successfully",
                                  toastLength: Toast.LENGTH_LONG,
                                  timeInSecForIosWeb: 1);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AdminDashboardScreen()));
                            },
                            child: Text("Delete",
                                style: TextStyle(color: Colors.lightBlue)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}