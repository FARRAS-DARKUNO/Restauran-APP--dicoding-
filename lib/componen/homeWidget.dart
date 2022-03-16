import 'package:flutter/material.dart';
import 'package:restaurant_app/deatail_menu.dart';
import '../api/get_home_detail.dart';
import '../text_theme.dart';
import '../model/home_detail_data/homerestoran.dart';

class HomeWidget extends StatelessWidget {
  final bool error;
  //final String message;
  final int count;
  final List<Restaurant> restaurants;

  const HomeWidget(this.error, this.count, this.restaurants, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(right: 8, left: 8, bottom: 8),
          color: Color.fromARGB(255, 34, 205, 211),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 170,
                  child: Center(
                    child: Text(
                      'DICODING RESTAURANT',
                      style: Theme.of(context).textTheme.headline4,
                      //textAlign: TextAlign.start,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10, left: 10, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(),
                          Container(
                            child: Text(
                              ' Recommended Restaurant',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            itemCount: this.restaurants.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailMenu(
                                              idRestorant:
                                                  this.restaurants[index].id)));
                                },
                                child: Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 100,
                                      color: Color.fromARGB(255, 203, 245, 247),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Image.network(
                                                  'https://restaurant-api.dicoding.dev/images/medium/${this.restaurants[index].pictureId}'),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    this
                                                        .restaurants[index]
                                                        .name,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Icon(Icons.location_on),
                                                      Text(
                                                        this
                                                            .restaurants[index]
                                                            .city,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
