import 'package:flutter/material.dart';
import '../model/restauran_detail_data/menu.dart';
import '../text_theme.dart';
import 'package:provider/provider.dart';

class DetailWidget extends StatefulWidget {
  final String id;
  final String name;
  final String description;
  final String city;
  final String pictureId;
  final Menus menus;

  const DetailWidget(this.id, this.name, this.description, this.city,
      this.pictureId, this.menus,
      {Key? key})
      : super(key: key);

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  Color _colora = Colors.white;
  Color _colorb = Colors.white;
  Color _color1 = Colors.white;
  Color _color2 = Color.fromARGB(255, 106, 162, 207);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 203, 245, 247),
          margin: EdgeInsets.only(right: 8, left: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 265,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                        'https://restaurant-api.dicoding.dev/images/medium/${this.widget.pictureId}'),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.widget.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        this.widget.city,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                this.widget.description,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'MENU',
                style: Theme.of(context).textTheme.headline6,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'FOODS',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: this.widget.menus.foods.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _colora = _color2;
                                  });
                                },
                                child: Card(
                                  child: Container(
                                    color: _colora,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Center(
                                        child: Text(this
                                            .widget
                                            .menus
                                            .foods[index]
                                            .name),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Drinks',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: this.widget.menus.drinks.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _colorb = _color2;
                                  });
                                },
                                child: Card(
                                  child: Container(
                                    color: _colorb,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Center(
                                        child: Text(this
                                            .widget
                                            .menus
                                            .drinks[index]
                                            .name),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
