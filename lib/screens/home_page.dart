// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:public_toilets/screens/toilet_list_item.dart';


import '../../repositories/toilet_repository.dart';
import '../models/toilet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _toiletNameController = TextEditingController();
  final TextEditingController pointController = TextEditingController();
  final TextEditingController distanceController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Public Toilets'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ToiletRepository.toilets.length,
              itemBuilder: (ctx, i) {
                Toilet toilet = ToiletRepository.toilets[i];

                return ToiletListItem(
                  toilet: toilet,
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _toiletNameController,
                  decoration: InputDecoration(
                    hintText: 'ชื่อห้องน้ำ',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Colors.greenAccent
                      ), //<-- SEE HERE
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: pointController,
                        decoration: InputDecoration(
                          hintText: 'ให้คะแนน',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Colors.greenAccent

                            ), //<-- SEE HERE
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: distanceController,
                        decoration: InputDecoration(
                          hintText: 'ระยะทาง',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Colors.greenAccent

                            ), //<-- SEE HERE
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(onPressed: () {
                    var toiletName = _toiletNameController.text;
                    var point = double.tryParse(pointController.text) ?? 0;
                    var distance = double.tryParse(distanceController.text) ?? 0.0;
                    var toilet = Toilet(
                        name: toiletName, point: point, distance: distance);

                    setState(() {
                      ToiletRepository.toilets.add(toilet);
                    });

                    _toiletNameController.clear();
                    pointController.clear();
                    distanceController.clear();

                  },
                      child: Text('ADD')),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


