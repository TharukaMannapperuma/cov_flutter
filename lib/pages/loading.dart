import 'package:covid19/dataSource.dart';
import 'package:flutter/material.dart';
import 'package:covid19/pages/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

void setupWorldData() async {
  CovidData instance = CovidData();
  await instance.fetchWorldData();
  Navigator.pushReplacementNamed(context, '/home',arguments: {
    "worldData":instance.worldData,
    "countryData":instance.countryData
  });
}

  @override
  void initState() {
    // TODO: implement initState
    setupWorldData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryBlack,
        child: Center(
          child: SpinKitFoldingCube(
            color: Colors.grey[100],
            size: 50.0,
          ),
        ),
      ),

    );
  }
}

