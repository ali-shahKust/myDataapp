import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ClinicalTrails.dart';

class Reference extends StatefulWidget {
  @override
  _ReferenceState createState() => _ReferenceState();
}
List<String> ReferanceData = [];

class _ReferenceState extends State<Reference> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Image.asset("images/logo.png",height: 40,width: 40,),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.chat),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: 60,
              color: Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                           showSearch(context: context, delegate: SearchDx());
                          },
                          child: Container(

                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: IconButton(
                          onPressed: (){
                          },
                          icon: Icon(Icons.search),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:5.0,right: 5.0),
                  child: Text("Plans-> Movement Disorders->Hypokenetic Discords"),
                ),
              ),
            ),
            Column(
              children: [
                Text("# Parkinson's Disease",style: TextStyle(fontSize: 25),),
                SizedBox(height: 8.0,),
                Text("Image Source: Wikimedia Commons",style: TextStyle(fontStyle: FontStyle.italic),)
              ],
            ),
            SizedBox(height: 15.0,),
            Image.asset("images/brain.jpg")
          ],
        ),
      ),
    );
  }
}
class SearchDx extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return<Widget> [
      IconButton(
        onPressed: (){
          query = "";
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List myList = query.isEmpty ? recentList : ReferanceData.where((p) {
      var data = p.toLowerCase();
      return data.startsWith(query);
    }).toList();
    return myList.isEmpty ? ListTile(title: Text('No Data Found')) : ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) => ListTile(title: Text('${myList[index]}'),onTap: (){
          query = myList[index];
          recentList.add(query);
          showResults(context);
        },)
    );
  }
}