import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen>
{


  late bool newuser;

  late String email1 ="";
  late String password1 ="";

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formkey = GlobalKey<FormState>();



  bool _showPassword = false;

  void _togglePasswordView() {
    setState(() {
      _showPassword = !_showPassword;

    });
  }
  void _submit()
  {
    if (_formkey.currentState!.validate())
    {

     _formkey.currentState!.save();

      showDialog
        (
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Login Successful'),backgroundColor: Colors.greenAccent.shade100,
          actions:
          [
            TextButton
              (
              onPressed: ()
              {

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(email1: email.text.toString(), password1: password.text.toString())));

              },
              child: Text('OK'),
            )
          ],
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade100,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 48),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Welcome back',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                   SizedBox(height: 8),
                  Text(
                    'Please sign in to continue',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                   SizedBox(height: 40),

                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value)
                          {
                            if(value!.isEmpty)
                              {
                                return "Please Enter A Email";

                              }


                          },

                        ),
                        SizedBox(height: 24),

                        TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _showPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),

                              onPressed: _togglePasswordView,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          obscureText: !_showPassword,
                          validator: (value)
                          {
                            if(value!.isEmpty)
                              {
                                return "Please Enter Password";
                              }
                            if(value.length < 6)
                              {
                                return "Password Must be at Least 6 Characterr";
                              }
                            return null;

                          },


                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 36),

                  ElevatedButton(
                    onPressed: _submit,
                    child: Text('Sign In'),
                  ),

                  SizedBox(height: 24),

                  TextButton(

                    onPressed: () {


                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Reset Password tapped')),
                      );
                    },
                    style: TextButton.styleFrom(foregroundColor: Colors.greenAccent.shade100),
                    child: Text('Forgot Password?'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
