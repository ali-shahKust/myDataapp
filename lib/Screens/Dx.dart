import 'package:flutter/material.dart';

import 'ClinicalTrails.dart';

class Dx extends StatefulWidget {
  @override
  _DxState createState() => _DxState();
}

String wcPara =
  "This app provides a concise summary of various neurological diseases. The material here has been tediously compiled from popular resources such as UpToDate, Mayo Clinical Neurology Board Review, Cheng Cheng's and other sources.";

String wcPara2 =
  "it also features sample plan for various disorders that may neurologist in training may find valuable. Explore the bottom sections to learn about everything there is to offer";

String disclamer = "Disclaimer: This app is designed only for reference purposes and should not be used in the management of any actual patient. always rely on your clinical judgement.";
class _DxState extends State<Dx> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome to",style: TextStyle(fontStyle: FontStyle.italic),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("The Ultimate",style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Neurology",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Resident Guide",style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  Text(wcPara,style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10.0,),
                  Text(wcPara2,style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10.0,),
                  Text(disclamer,style: TextStyle(fontStyle: FontStyle.italic),),
                  SizedBox(height: 10.0,),
                ],
              ),
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
