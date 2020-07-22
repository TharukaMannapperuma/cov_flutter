import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:number_display/number_display.dart';

final display = createDisplay(
  length: 16,
  decimal: 0,
);

class WorldWide extends StatelessWidget {
  final Map worldData;
  const WorldWide({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2
        ),
        children: <Widget>[
          StatusPanel(
            title: "Confirmed",
            panelColor1: Colors.blue[200],
            textColor: Colors.blue[900],
            count: display(worldData["cases"]).toString(),
          ),
          StatusPanel(
            title: "Active",
            panelColor1: Colors.amber[200],
            textColor: Colors.amber[900],
            count: display(worldData["active"]).toString(),
          ),
          StatusPanel(
            title: "Recovered",
            panelColor1: Colors.green[200],
            textColor: Colors.green[900],
            count: display(worldData["recovered"]).toString(),
          ),
          StatusPanel(
            title: "Deaths",
            panelColor1: Colors.red[200],
            textColor: Colors.red[900],
            count: display(worldData["deaths"]).toString(),
          ),

        ],
      ),
    );
  }
}
class StatusPanel extends StatelessWidget {

  final Color panelColor1;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor1, this.textColor, this.title, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/7,
      width: MediaQuery.of(context).size.width/2,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: panelColor1,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(15.0),
          topRight: const Radius.circular(15.0),
          bottomRight: const Radius.circular(15.0),
          bottomLeft: const Radius.circular(15.0),
        ),
        boxShadow: [
          BoxShadow(
            color: panelColor1.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: textColor
            ),
          ),
          Text(
            count,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              color: textColor
            ),
          ),
        ],
      ),
    );
  }
}

