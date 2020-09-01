import 'package:flutter/material.dart';

import 'ClinicalTrails.dart';

class Plans extends StatefulWidget {
  @override
  _PlansState createState() => _PlansState();
}

List<String> planData = [

  "Do That",
  "Be there",
  "Consult them",
  "Etc",
  "Etc",
  "Do That",
  "Be there",
  "Consult them",
  "Etc",
  "Etc",
  "Do That",
  "Be there",
  "Consult them",
  "Etc",
  "Etc",

];
class _PlansState extends State<Plans> {


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
            onPressed: (){},
            icon: Icon(Icons.chat),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                Text("# Parkinson's Disease",style: TextStyle(fontSize: 25),)
              ],
            ),
            Container(
              height: 500,
                  child: ListView.builder(
                  itemCount: planData.length,
                  itemBuilder: (ctx,i){
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text("- ${planData[i]}",style: TextStyle(fontSize: 20),),
                    );
                  }),
            )
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
    List myList = query.isEmpty ? recentList : planData.where((p) {
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