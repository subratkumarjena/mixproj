 import 'package:flutter/material.dart';

class Notedetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: (
      AppBar(title: Text('Details'),)
      ),
      body: Container(
        height:200,
        width: double.infinity,
        color: Colors.purple,
        child: Row(

          children: [
            Container(
              width:230 ,
              color: Colors.cyan,
              child: Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("title",style: TextStyle(height: 10,color: Colors.white),),
                  ),

                  Text("Description"),

                ],
              ),
            ),
            Container(
              width: 150,
              color: Colors.white,
            ),

          ],

        ),



      ),
    );
  }

}