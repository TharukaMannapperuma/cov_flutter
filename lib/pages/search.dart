import 'package:flutter/material.dart';
import 'package:number_display/number_display.dart';

final display = createDisplay(
  length: 16,
  decimal: 0,
);
class Search extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.white)));
  }
  String get searchFieldLabel => 'Search Country';
  final List countryList;

  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestList = query.isEmpty
        ? countryList
        : countryList
        .where((element) =>
        element["country"].toString().toLowerCase().startsWith(query))
        .toList();
    return ListView.builder(
        itemCount: suggestList.length,
        itemBuilder: (context,index){
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
                      Text(suggestList[index]["country"],style: TextStyle(fontWeight: FontWeight.bold),),
                      Image.network(suggestList[index]["countryInfo"]["flag"],height: 60,width: 80,)
                    ],
                  ),
                ),
                Expanded(child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Total Cases: "+display(suggestList[index]["cases"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[500]),),
                      Text("Today Cases: "+display(suggestList[index]["todayCases"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink[500]),),
                      Text("Total Deaths: "+display(suggestList[index]["deaths"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[500]),),
                      Text("Today Deaths: "+display(suggestList[index]["todayDeaths"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent),),
                      Text("Active Cases: "+display(suggestList[index]["active"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[500]),),
                      Text("Total Recovered: "+display(suggestList[index]["recovered"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green[500]),),

                    ],
                  ),
                ),)
              ],
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestList = query.isEmpty
        ? countryList
        : countryList
        .where((element) =>
        element["country"].toString().toLowerCase().startsWith(query))
        .toList();
    return ListView.builder(
      itemCount: suggestList.length,
        itemBuilder: (context,index){
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
                  Text(suggestList[index]["country"],style: TextStyle(fontWeight: FontWeight.bold),),
                  Image.network(suggestList[index]["countryInfo"]["flag"],height: 60,width: 80,)
                ],
              ),
            ),
            Expanded(child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Total Cases: "+display(suggestList[index]["cases"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[500]),),
                  Text("Today Cases: "+display(suggestList[index]["todayCases"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink[500]),),
                  Text("Total Deaths: "+display(suggestList[index]["deaths"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[500]),),
                  Text("Today Deaths: "+display(suggestList[index]["todayDeaths"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent),),
                  Text("Active Cases: "+display(suggestList[index]["active"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[500]),),
                  Text("Total Recovered: "+display(suggestList[index]["recovered"]).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green[500]),),

                ],
              ),
            ),)
          ],
        ),
      );
    });
  }
}
