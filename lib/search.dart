import 'package:flutter/material.dart';
import 'api/get_search_detail.dart';
import './model/Searching/seacrhingdata.dart';
import 'componen/searchingwidget.dart';

class Search extends StatefulWidget {
  final String seacrhingfile;
  Search({required this.seacrhingfile});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  RestauranSearch api = RestauranSearch();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.getSeacrh(widget.seacrhingfile),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return SearchingWidget(
            snapshot.data.error,
            snapshot.data.founded,
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
