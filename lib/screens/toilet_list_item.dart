// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../models/toilet.dart';


class ToiletListItem extends StatelessWidget {
  final Toilet toilet;


  const ToiletListItem({
    super.key,
    required this.toilet,

  });

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.home, size: 25.0,),
            Expanded(
              child: Text(
                toilet.name,
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    // collection if, ไม่ใช่ is statement
                    if(toilet.point > 3) // จาก 2.5
                      Text('GOOD'),

                    //collection for, ไม่ใช่ for statement
                    for(var i = 0; i < toilet.point.floor(); i++)
                      Icon(Icons.star),

                    Text(toilet.point.toString())
                  ],
                ),
                Text(toilet.distance.toString())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
