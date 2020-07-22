import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          child:Text("Wash Hands All The Time",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),)
        ),
      ),
    );
  }
}
