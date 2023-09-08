
import 'package:flutter/material.dart';

Widget DataUser(IconData icons, String dataUser) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), 
    border: Border.all(color: Colors.black54)
    ),
    padding: EdgeInsets.all(15),
    margin: EdgeInsets.only(left: 30, right: 30, top: 10),
    child: Row(
      children: [
        Icon(icons),
        Text(dataUser)
      ],
    ),
  );
}
