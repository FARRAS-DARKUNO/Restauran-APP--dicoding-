import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tidak Ada Sinyal')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('./images/oops_small.png'))),
            )
          ],
        ),
      ),
    );
  }
}
