import 'dart:convert';
import 'package:http/http.dart' as http;

class CovidData {
  Map worldData;
  List countryData;

  CovidData({this.worldData,this.countryData});

  Future<void> fetchWorldData()async{

    try{
      http.Response response = await http.get("https://disease.sh/v2/all");
      worldData = jsonDecode(response.body);
      http.Response response2 = await http.get("https://disease.sh/v2/countries?sort=cases");
      countryData = jsonDecode(response2.body);
    }
    catch(e){
      worldData ={"country" : "Data Loading Failed"};
    }
  }
}