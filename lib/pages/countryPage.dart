import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_display/number_display.dart';
import 'package:covid19/pages/search.dart';

final display = createDisplay(
  length: 16,
  decimal: 0,
);

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;
  Map data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    countryData = data["countryData"];
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon:Icon(Icons.search),onPressed: (){
            showSearch(context: context, delegate: Search(countryData));
          },)
        ],
        title: Padding(
          padding: const EdgeInsets.fromLTRB(50,2,2,2),
          child: Text("Country Status",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
      body: countryData==null?Center(child: CircularProgressIndicator(),):ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 130,
            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            decoration: BoxDecoration(color: Theme.of(context).accentColor,boxShadow: [
              BoxShadow(color: Theme.of(context).brightness == Brightness.light?Colors.grey[100]:Colors.grey[900],blurRadius: 10,offset: Offset(0,10))
            ]),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(countryData[index]["country"],style: TextStyle(fontWeight: FontWeight.bold),),
                      Image.network(countryData[index]["countryInfo"]["flag"],height: 60,width: 80,)
                    ],
                  ),
                ),
                Expanded(child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Total Cases: "+display(countryData[index]["cases"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[500]),),
                      Text("Today Cases: "+display(countryData[index]["todayCases"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink[500]),),
                      Text("Total Deaths: "+display(countryData[index]["deaths"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[500]),),
                      Text("Today Deaths: "+display(countryData[index]["todayDeaths"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent),),
                      Text("Active Cases: "+display(countryData[index]["active"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[500]),),
                      Text("Total Recovered: "+display(countryData[index]["recovered"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green[500]),),

                    ],
                  ),
                ),)
              ],
            ),
          );
        },
        itemCount: countryData == null ? 0 : countryData.length,
      ),
    );
  }
}
