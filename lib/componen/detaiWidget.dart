import 'package:flutter/material.dart';
import '../model/menu.dart';
import '../text_theme.dart';

class DetailWidget extends StatelessWidget {
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
                        'https://restaurant-api.dicoding.dev/images/medium/${this.pictureId}'),
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
                    this.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        this.city,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                this.description,
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
                            itemCount: this.menus.foods.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Text(this.menus.foods[index].name),
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
                            itemCount: this.menus.drinks.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Text(this.menus.drinks[index].name),
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
