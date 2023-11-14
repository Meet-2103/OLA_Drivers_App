import 'package:flutter/material.dart';
import 'package:olacab/global/global.dart';
import 'package:olacab/splashScreen/splash_screen.dart';
class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      ElevatedButton(
          child: Text("SIGN OUT",),
        onPressed: ()
        {
          fAuth.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (c)=>MySplash_Screen()));
      },
      ),
    );
  }
}
