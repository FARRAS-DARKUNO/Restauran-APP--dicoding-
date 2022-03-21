import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/deatail_menu.dart';
import 'package:restaurant_app/model/home_detail_data/homedata.dart';
import 'componen/homeWidget.dart';
import 'api/get_home_detail.dart';
import 'connnectivity_provider.dart';
import 'package:provider/provider.dart';
import 'no_internet.dart';

class Homes extends StatefulWidget {
  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  HomeDetail api = HomeDetail();

  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return pageUI();
  }

  Widget pageUI() {
    return Consumer<ConnectivityProvider>(builder: (context, modal, child) {
      if (modal.isOnline != null) {
        return modal.isOnline
            ? FutureBuilder(
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
              )
            : NoInternet();
      }
      return Container(
        child: Center(child: CircularProgressIndicator()),
      );
    });
  }
}
