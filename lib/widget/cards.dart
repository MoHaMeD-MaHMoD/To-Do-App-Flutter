// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../main.dart';

class CardWidget extends StatelessWidget {
  Function deleteQuotes;
  BestQuotes item;
  CardWidget({required this.deleteQuotes, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(230, 0, 125, 0.8),
      margin: EdgeInsets.all(11),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      child: Container(
        padding: EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("${item.title} ",
                style: TextStyle(fontSize: 24, color: Colors.white),
                textDirection: TextDirection.rtl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    deleteQuotes(item);
                  },
                  icon: Icon(Icons.delete),
                  iconSize: 32,
                  color: Color.fromRGBO(153,245,195, 0.8),
                ),
                Text("${item.auther}",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    textDirection: TextDirection.rtl),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
