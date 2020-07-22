import 'dart:convert';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:covid19/dataSource.dart';
import 'package:covid19/panels/worldwide.dart';
import 'package:covid19/panels/topCountires.dart';
import 'package:covid19/panels/footer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;
  List countryData;
  Map data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    worldData = data["worldData"];
    countryData = data["countryData"];
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Theme.of(context).brightness==Brightness.light?Icons.lightbulb_outline:Icons.highlight),onPressed: (){
              DynamicTheme.of(context).setBrightness(Theme.of(context).brightness==Brightness.light?Brightness.dark:Brightness.light);
          },),
        ],
        centerTitle: false,
        title: Text('Covid-19 Tracker'),
      ),
      body: RefreshIndicator(
        onRefresh:() => Navigator.pushReplacementNamed(context, "/"),
        color: Colors.blue,
        child: SingleChildScrollView(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff141E30),Color(0xff243B55)]
                ),

              ),
              height: MediaQuery.of(context).size.height/7,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                DataSource.quote,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "WorldWide",
                    style: TextStyle(
                      fontSize: 22,fontWeight: FontWeight.bold
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/country',arguments: {"countryData":countryData});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xff141E30),Color(0xff243B55)]
                          ),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(15.0),
                          topRight: const Radius.circular(15.0),
                          bottomRight: const Radius.circular(15.0),
                          bottomLeft: const Radius.circular(15.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff141E30).withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(1, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Region",
                        style: TextStyle(
                            fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            WorldWide(worldData: worldData,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
              child: Text("Top 5 Most Affected Countries", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            ),
            TopFive(countryData: countryData,),
            Divider(
                color: Theme.of(context).brightness == Brightness.light?Theme.of(context).primaryColor:Colors.white,
              thickness: 5,
            ),
            Footer(),
          ],
        ),

        ),
      ),
    );
  }
}
