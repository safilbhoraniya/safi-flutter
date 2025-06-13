import 'package:flutter/material.dart';
import 'package:nymra/Loginscreen.dart';
import 'package:nymra/payment.dart';
import 'package:nymra/setting.dart';

import 'package:nymra/userprofile.dart';
import 'package:nymra/video.dart';
import 'package:nymra/videopost.dart';
import 'Privacy.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen(String text, {super.key, required TextEditingController email});
  String email1;
  String password1;
  HomeScreen({required this.email1,required this.password1});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>

{
  int _selectedIndex = 0;

  static const List<Widget> _screens =
  [
    videopost(),
    storyupload(),
    payment(),
    userprofile(),
  ];

  void _onNavItemTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(
        title: Text("Welcome To Nymra"),
        backgroundColor: Colors.greenAccent,
        actions:
        [
          IconButton(onPressed: ()
          {

            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => Loginscreen()));

          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Center
        (
        child: Container
          (
          padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: _screens[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Color(0xFF9CA3AF),
        showUnselectedLabels: true,
        onTap: _onNavItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_upload_outlined),
            label: 'Upload',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.payment_outlined),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
     drawer: Drawer
       (
          child: Column
            (
              children:
              [
                UserAccountsDrawerHeader
                  (
                    currentAccountPicture: Image.network("https://static-00.iconduck.com/assets.00/profile-circle-icon-256x256-cm91gqm2.png",height: 60,width: 60,),

                    //otherAccountsPictures: [Image.network("https://static-00.iconduck.com/assets.00/profile-circle-icon-256x256-cm91gqm2.png",height: 50,width: 50,)],
                    accountName: Text("Your Profile",style: TextStyle(fontSize: 25,color: Colors.black),),
                    accountEmail: Text(widget.email1,style: TextStyle(fontSize: 20,color: Colors.black),),
                  arrowColor: Colors.black87,
                  decoration: BoxDecoration(color: Colors.greenAccent,),
                  ),
                Text("______________________________________________",style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text("Setting And Privacy"),
                ListTile
                  (
                    title: Text("Settings",),
                    trailing: Icon(Icons.settings),
                    leading: Icon(Icons.verified_user_outlined),
                    iconColor: Colors.greenAccent,
                    splashColor: Colors.greenAccent,
                    hoverColor: Colors.black,
                    focusColor: Colors.yellow,
                    onTap: ()
                    {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Setting()));
                    },
                  ),
                SizedBox(height: 5,),
                ListTile
                  (
                    title: Text("Privacy"),
                    trailing: Icon(Icons.person_off),
                    leading: Icon(Icons.password,),
                    iconColor: Colors.greenAccent,
                    splashColor: Colors.greenAccent,
                    hoverColor: Colors.black,
                    focusColor: Colors.yellow,
                    onTap:()
                    {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Privacy(email2:widget.email1,password2:widget.password1)));
                    }
                  ),

              ],

            ),
       ),

      );
  }
}
