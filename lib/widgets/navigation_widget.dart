import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'user_info.dart';

class NavigationDrawer extends StatelessWidget {
  final FirebaseUser user;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  NavigationDrawer({this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UsersInfo(
              imageUrl: user.photoUrl,
              userName: user.displayName,
              uId: user.uid,
            ),
//            decoration: BoxDecoration(
//                color: Colors.green,
//                image: DecorationImage(
//                    fit: BoxFit.fill,
//                    image: AssetImage('assets/images/cover.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async {
              await googleSignIn.signOut();
              Navigator.of(context).pop();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
