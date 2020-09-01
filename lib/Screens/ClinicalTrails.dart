import 'package:flutter/material.dart';

class ClinicalTrails extends StatefulWidget {
  @override
  _ClinicalTrailsState createState() => _ClinicalTrailsState();
}

List<String> dxData = [

  "Movement Disorders",
  "something",
  "Disorders",
  "Scrollable",
  "Suggest",
  "looking",
  "whatever",
  "lowercase",
  "UpperCase",
  "Banefit",
  "Super Duper",
  "Colgate Max",
  "Pakistan",
  "United State Of America",
  "Movement Disorders",
  "something",
  "Disorders",
  "Scrollable",
  "Suggest",
  "looking",
  "whatever",
  "lowercase",
  "UpperCase",
  "Banefit",
  "Super Duper",
  "Colgate Max",
  "Pakistan",

];

List<String> recentList = [];

@override

class _ClinicalTrailsState extends State<ClinicalTrails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Image.asset("images/logo.png",height: 40,width: 40,),
        actions: [
          IconButton(
            onPressed: (){
               showSearch(context: context, delegate: SearchDx());
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
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
//                            showSearch(context: context, delegate: SearchDx());
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
          ListView.builder(
                  shrinkWrap: true,
                  itemCount: dxData.length,
                  itemBuilder: (ctx,i){
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dxData[i]),
                      ),
                    );
                  }
                ),
        ],
      )
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
    List myList = query.isEmpty ? recentList : dxData.where((p) {
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