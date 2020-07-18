import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersInfo extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final String uId;

  UsersInfo({this.imageUrl, this.userName, this.uId});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(
              0xFF4CB050,
            ),
            Color(0xFF7CD756)
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            child: Image(
              fit: BoxFit.fill,
              image: imageUrl != null && imageUrl.trim().length > 0
                  ? NetworkImage(imageUrl)
                  : AssetImage('assets/images/image_not_found.png'),
//              image: imageUrl.trim().length > 0
//                  ? NetworkImage(imageUrl)
//                  : AssetImage('assets/images/image_not_found.png'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(userName != null ? userName : ''),
          SizedBox(
            height: 10,
          ),
          Text(uId != null ? 'ID : $uId' : ''),
        ],
      ),
    );
  }
}
