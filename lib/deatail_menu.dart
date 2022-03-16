import 'package:flutter/material.dart';
import 'text_theme.dart';
import 'model/temporary.dart';
import 'api/get_restaurant_detail.dart';
import 'componen/detaiWidget.dart';

class DetailMenu extends StatefulWidget {
  final String idRestorant;
  DetailMenu({required this.idRestorant});

  @override
  State<DetailMenu> createState() => _DetailMenuState();
}

class _DetailMenuState extends State<DetailMenu> {
  RestaurantDetail api = RestaurantDetail();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.getRestaurantDetail(widget.idRestorant),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return DetailWidget(
              snapshot.data.id,
              snapshot.data.name,
              snapshot.data.description,
              snapshot.data.city,
              snapshot.data.pictureId,
              snapshot.data.menus);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
