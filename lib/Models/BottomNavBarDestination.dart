import 'package:flutter/material.dart';

class Destination{
  final String title;
  final IconData icon;
  const Destination(this.title,this.icon);

}

const List<Destination> allDestination = <Destination>[
  Destination('Dx', Icons.home,),
  Destination('Plans', Icons.content_paste),
  Destination('Rx', Icons.hourglass_full),
  Destination('References', Icons.library_books),
  Destination('Clinical Trails', Icons.local_hospital)

];