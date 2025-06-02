import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

String? _myCategory;

class AdminUpload extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdminUploadPage();
  }
}

class AdminUploadPage extends State<AdminUpload> {
  var size;

  var upload_category = TextEditingController();
  File _imageFile = File("");
  File _categoryimageFile = File("");
  final String uploadUrl =
      'https://safilbhoraniya.000webhostapp.com/project-123/upload_category_main_images.php';
  final ImagePicker _picker = ImagePicker();

  //-------------

  //----------------

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadData() async {
    try {
      // API endpoint
      var url = Uri.parse(
          'https://safilbhoraniya.000webhostapp.com/project-123/upload_category_main_images.php');

      // Prepare data to be sent
      var request = http.MultipartRequest('POST', url)
        ..fields['category_name'] = upload_category.text
        ..files.add(
            await http.MultipartFile.fromPath('category_img', _imageFile.path));

      // Send the request
      var response = await request.send();

      // Check the status code of the response
      if (response.statusCode == 200) {
        print('Data uploaded successfully');
      } else {
        print('Failed to upload data. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception while uploading data: $e');
    }
  }

  Future<void> _categorypickImage() async {
    final picker2 = ImagePicker();
    final pickedFile2 = await picker2.pickImage(source: ImageSource.gallery);

    if (pickedFile2 != null) {
      setState(() {
        _categoryimageFile = File(pickedFile2.path);
      });
    }
  }

  Future<void> _categoryuploadData() async {
    try {
      // API endpoint
      var url = Uri.parse(
          'https://safilbhoraniya.000webhostapp.com/project-123/upload_category_sub_images.php');

      // Prepare data to be sent
      var request = http.MultipartRequest('POST', url)
        ..fields['c_id'] = "1"
        ..files.add(
            await http.MultipartFile.fromPath('c_images', _imageFile.path));

      // Send the request
      var response = await request.send();

      // Check the status code of the response
      if (response.statusCode == 200) {
        print('Data uploaded successfully');
      } else {
        print('Failed to upload data. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception while uploading data: $e');
    }
  }

  Future<String?> uploadImage(filepath, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files
        .add(await http.MultipartFile.fromPath('profile_pic', filepath));
    var res = await request.send();
    return res.reasonPhrase;
  }

  Future<List> getCategoryName() async {
    var data = await http.get(Uri.parse(
        "https://safilbhoraniya.000webhostapp.com/project-123/category_view.php"));
    return json.decode(data.body);
  }

  //final String categoryUploadUrl = 'https://amisha1299.000webhostapp.com/Ewishes/upload_category_sub_image_insert.php';
  final ImagePicker _categoryPicker = ImagePicker();

  void _categoryPickImage() async {
    try {
      final pickedFile =
          await _categoryPicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _categoryImageFile = pickedFile;
      });
    } catch (e) {
      print("Image picker error " + e.toString());
    }
    await categoryUploadImage(_categoryImageFile,
     categoryUploadUrl + "?id=" + _myCategory.toString());
  }

  Future<String?> categoryUploadImage(filepath, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files
        .add(await http.MultipartFile.fromPath('profile_pic', filepath));
    var res = await request.send();
    return res.reasonPhrase;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      //_myCategory = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(size.width * 5 / 100,
                  size.height * 33 / 100, size.width * 5 / 100, 0),
              child: ConstrainedBox(
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
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: Colors.blueGrey,
                        title: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              "\tAdd Category",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        content: Container(
                          height: size.height * 14 / 100,
                          child: Column(
                            children: [
                              TextField(
                                controller: upload_category,
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
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.all(16.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (!upload_category.text.isEmpty) {
                                      _pickImage();
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Please Input Category Name",
                                          toastLength: Toast.LENGTH_LONG,
                                          timeInSecForIosWeb: 1);
                                    }
                                  },
                                  child: Text(
                                    "Select Image".toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                        color: Colors.blueGrey,
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
                                style: TextStyle(color: Colors.blueGrey)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (upload_category.text.isNotEmpty &&
                                  _imageFile != null) {
                                //uploadImage(_imageFile, uploadUrl);
                                _uploadData();
                                Fluttertoast.showToast(
                                    msg: "Category Added Successfully",
                                    toastLength: Toast.LENGTH_LONG,
                                    timeInSecForIosWeb: 1);
                                Navigator.of(ctx).pop();
                              } else {
                                if (upload_category.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please Input Category Name",
                                      toastLength: Toast.LENGTH_LONG,
                                      timeInSecForIosWeb: 1);
                                } else if (_imageFile == null) {
                                  Fluttertoast.showToast(
                                      msg: "Please Select Category Image",
                                      toastLength: Toast.LENGTH_LONG,
                                      timeInSecForIosWeb: 1);
                                }
                              }
                            },
                            child: Text("Add",
                                style: TextStyle(color: Colors.blueGrey)),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    "Upload Category".toUpperCase(),
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 2 / 100),
            Padding(
              padding: EdgeInsets.fromLTRB(size.width * 5 / 100, 0,
                  size.width * 5 / 100, size.height * 33 / 100),
              child: ConstrainedBox(
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
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: Colors.blueGrey,
                        title: Row(
                          children: [
                            Icon(
                              Icons.upload,
                              color: Colors.white,
                            ),
                            Text(
                              "\tUpload Images",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        content: Container(
                          height: size.height * 14 / 100,
                          child: Column(
                            children: [
                              Expanded(
                                child: FutureBuilder<List>(
                                  future: getCategoryName(),
                                  builder: (ctx, ss) {
                                    if (ss.hasData) {
                                      return Items(list: ss.data!);
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
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
                                    if (_myCategory != null) {
                                      _categorypickImage();
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Please Select Category",
                                          toastLength: Toast.LENGTH_LONG,
                                          timeInSecForIosWeb: 1);
                                    }
                                  },
                                  child: Text(
                                    "Select Images".toUpperCase(),
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
                                style: TextStyle(color: Colors.blueGrey)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_myCategory != null &&
                                  _categoryimageFile != null) {
                                _categoryuploadData();
                                Fluttertoast.showToast(
                                    msg: "Images Uploaded Successfully",
                                    toastLength: Toast.LENGTH_LONG,
                                    timeInSecForIosWeb: 1);
                                Navigator.of(ctx).pop();
                              } else {
                                if (_myCategory == null) {
                                  Fluttertoast.showToast(
                                      msg: "Please Select Category",
                                      toastLength: Toast.LENGTH_LONG,
                                      timeInSecForIosWeb: 1);
                                } else if (_categoryimageFile == null) {
                                  Fluttertoast.showToast(
                                      msg: "Please Select Images",
                                      toastLength: Toast.LENGTH_LONG,
                                      timeInSecForIosWeb: 1);
                                }
                              }
                            },
                            child: Text("Upload",
                                style: TextStyle(color: Colors.blueGrey)),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    "Upload Images".toUpperCase(),
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
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
  List list_;
  _Items({required this.list_});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 14 / 100, 0, 0, 0),
              child: Text(
                "Select Category",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
            items: list_.map((item) {
              return DropdownMenuItem(
                child: Text(item['category_name']),
                value: item['id'].toString(),
              );
            }).toList(),
            onChanged: (newVal) {
              setState(() {
                _myCategory = newVal!;
              });
            },
            value: _myCategory,
          ),
        ));
  }
}