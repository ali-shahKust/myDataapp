import 'package:flutter/material.dart';

class Dx extends StatefulWidget {
  @override
  _DxState createState() => _DxState();
}

class _DxState extends State<Dx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Image.asset("images/makeup.png"),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.chat),
          )
        ],
      ),
      body: ListView(
        children: [
          Expanded(
            child: Container(
              child: Row(
                children: [
                  TextField(),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.search),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
