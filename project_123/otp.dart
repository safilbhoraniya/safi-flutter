import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_123/login.dart';
import 'package:project_123/signup.dart';

class OTPScreen extends StatefulWidget
{
  //const OTPScreen({super.key});
  String verificationId;
  OTPScreen({required this.verificationId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = '';
  TextEditingController _otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP verification', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue[100],
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Text("OTP Verification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26)),
                SizedBox(height: 20,),

                Text("We need to register your phone before getting started !",style: TextStyle(fontWeight: FontWeight.w400)),
                SizedBox(height: 20,),


                TextFormField(
                  controller: _otpcontroller,
                  decoration: InputDecoration
                    (
                      labelText: 'Enter OTP',
                      hintText: 'Enter OTP',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: Colors.greenAccent[70]
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter OTP';
                    }
                    return null;
                  },

                ),
                SizedBox(height: 20),

                MaterialButton(
                  minWidth: 200,
                  color: Colors.blue[100],
                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  onPressed: ()async
                  {
                    //await signInWithPhoneNumber(_otpcontroller.text.trim());
                    try{
                      PhoneAuthCredential credential = await PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: _otpcontroller.text.toString());
                      FirebaseAuth.instance.signInWithCredential(credential).then((value){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      });
                    }
                    catch(e){
                      print(e.toString());
                    }
                  },child: Text('Verify', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20,),

                GestureDetector(
                  onTap: ()
                  {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                  },child: Text('Edit Phone Number?',style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}