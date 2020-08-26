import 'package:dataapp/Screens/ClinicalTrails.dart';
import 'package:dataapp/Screens/Dx.dart';
import 'package:dataapp/Screens/Plans.dart';
import 'package:dataapp/Screens/Reference.dart';
import 'package:dataapp/Screens/Rx.dart';
import 'package:flutter/material.dart';
import 'Screens/ClinicalTrails.dart';

import 'Models/BottomNavBarDestination.dart';
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _currentIndex = 0;

  final allScreensDestination = [
    Dx(),
    Plans(),
    Rx(),
    Reference(),
    ClinicalTrails()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: allScreensDestination,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(color: Colors.black),
          selectedIconTheme: IconThemeData(
              color: Colors.black
          ),
          backgroundColor: Colors.white,
          onTap: (int index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: allDestination.map((Destination destination){
            return BottomNavigationBarItem(
                icon : Icon(destination.icon,),
                backgroundColor: Colors.black,
                title: Text(destination.title)
            );
          }).toList()
      ),
    );
  }
}
