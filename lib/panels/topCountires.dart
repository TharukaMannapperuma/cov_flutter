import 'package:flutter/material.dart';
import 'package:number_display/number_display.dart';

final display = createDisplay(
  length: 16,
  decimal: 0,
);

class TopFive extends StatelessWidget {
  final List countryData;

  const TopFive({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network(countryData[index]["countryInfo"]["flag"],height: 45,width: 70,),
              Text(countryData[index]["country"],style: TextStyle(fontWeight: FontWeight.bold),),
              Text("Deaths: "+display(countryData[index]["deaths"]).toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
            ],
          ),
        );
      },
        itemCount: 5,),
    );
  }
}
