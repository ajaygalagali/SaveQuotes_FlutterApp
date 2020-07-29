import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'QuoteList.dart';

class quote_card extends StatelessWidget {

  QuoteList e;
  final Function delete;


  quote_card({this.e,this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 8,right: 8,top: 8),
      elevation: 5,
      child: Padding(padding: EdgeInsets.all(16),
        child: Column(

          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Expanded(
                flex: 9,
                child: Column(children: <Widget>[
                  Text(
                    e.text,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed:delete,
                    color: Colors.black45,
                  )
                ],),
              )
            ],),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  e.author,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ],
        ),),
    );
  }
}