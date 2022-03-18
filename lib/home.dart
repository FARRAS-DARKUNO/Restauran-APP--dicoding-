import 'package:flutter/material.dart';
import 'package:restaurant_app/deatail_menu.dart';
import 'package:restaurant_app/model/home_detail_data/homedata.dart';
import 'componen/homeWidget.dart';
import 'api/get_home_detail.dart';

class Homes extends StatefulWidget {
  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  HomeDetail api = HomeDetail();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.getHomeDetailData(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return HomeWidget(
            snapshot.data.error,
            snapshot.data.count,
            snapshot.data.restaurants,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
