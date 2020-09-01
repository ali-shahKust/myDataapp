import 'package:flutter/material.dart';

import 'ClinicalTrails.dart';

class Rx extends StatefulWidget {
  @override
  _RxState createState() => _RxState();
}
List<String> rxMechanism = [
  "This app provides a concise summary of various",
  "neurological diseaces. The material here has",
  "neurological disease. This Material her has",
];
List<String> rxUses = [
  "It also features sample plans for vaious disorders",
  "that any neurologist in training may",
];
List<String> rxSide = [
  "This app provides a concise summary of various",
  "neurological diseaces. The material here has",
  "neurological disease. This Material her has",
];
List<String> rxOther = [
  "It also features sample plans for vaious disorders",
  "that any neurologist in training may",
];

class _RxState extends State<Rx> {


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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Lovodopa \n (Sinemet)",style: TextStyle(fontSize: 25),)
                ],
              ),
              SizedBox(height: 10,),
              Text("Mechanism:",style: TextStyle(fontSize: 20,),),
              ListView.builder(
                shrinkWrap: true,
                itemCount: rxMechanism.length,
                itemBuilder: (ctx,i){
                  return Text("-  ${rxMechanism[i]}");
                }),
              SizedBox(height: 10,),
              Text("Uses and Doses:",style: TextStyle(fontSize: 20,),),
              ListView.builder(
                shrinkWrap: true,
                itemCount: rxUses.length,
                itemBuilder: (ctx,i){
                  return Text("-  ${rxUses[i]}");
                }),
              SizedBox(height: 10,),
              Text("Side-Effects:",style: TextStyle(fontSize: 20,),),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: rxSide.length,
                  itemBuilder: (ctx,i){
                    return Text("-  ${rxSide[i]}");
                  }),
              SizedBox(height: 10,),
              Text("Other info:",style: TextStyle(fontSize: 20,),),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: rxOther.length,
                  itemBuilder: (ctx,i){
                    return Text("-  ${rxOther[i]}");
                  }),
            ],
          ),
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
    List myList = query.isEmpty ? recentList : rxMechanism.where((p) {
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