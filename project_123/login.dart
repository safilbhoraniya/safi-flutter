import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_123/admin/admin_dashboard.dart';
import 'package:project_123/signup.dart';
import 'package:project_123/user/user_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget
{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  String? _mobilenumber;
  String? _password;

  final _formKey = GlobalKey<FormState>();

  late SharedPreferences sharedPreferences;
  late bool newuser;

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar
        (
        title: Text('Login Form', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue[100],
      ),
      body: Center
        (
          child: Stack(
            children:
            [
              SingleChildScrollView
                (
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                          hintText: 'Enter mobile number',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          filled: true,
                          fillColor: Colors.pinkAccent[70],
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a mobile number';
                          }
                          if (value.length != 10) {
                            return 'Mobile number must be 10 digits';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _mobilenumber = value;
                        },
                      ),
                      SizedBox(height: 20),

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter password',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            filled: true,
                            fillColor: Colors.greenAccent[70]
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        obscureText: true,
                        onSaved: (value) {
                          _password = value;
                        },
                      ),
                      SizedBox(height: 20),

                      MaterialButton(
                        minWidth: 200,
                        color: Colors.blue[100],
                        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        onPressed: (){
                          _submitForm();
                        },child: Text('Login', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Text('Dont have an account',style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SignupScreen()));
                            },child: Text('Signup',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

  void _submitForm()
  {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('Mobile Number: $_mobilenumber');
      print('Password: $_password');

      if(_mobilenumber=="1234123412" && _password=="1234")
      {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AdminDashboardScreen()));
      }
      else
      {
        _login();
      }
    }
  }
  void _login()async
  {

    var response = await http.post(Uri.parse("https://safilbhoraniya.000webhostapp.com/project-123/login.php"),body:
    {
      "mobile":_mobilenumber.toString(),
      "password":_password.toString(),
    });

    var data = json.decode(response.body);

    if(data==0)
    {
      print("fail");
      final snackbar = SnackBar(content: const Text('Login Fail'),);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    else
    {
      print("success");
      sharedPreferences.setBool('project', false);
      sharedPreferences.setString('mob',_mobilenumber.toString());
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => UserDashboardScreen()));
    }
  }

  void checkLogin()async
  {
    sharedPreferences = await SharedPreferences.getInstance();

    newuser = (sharedPreferences.getBool('project')?? true);
    print(newuser);
    if(newuser == false)
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserDashboardScreen()));
    }
  }
}