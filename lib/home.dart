import 'package:flutter/material.dart';
import 'package:restaurant_app/deatail_menu.dart';
import 'model/temporary.dart';

class Homes extends StatefulWidget {
  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  List temporary = data['restaurants'];
  Map item = data;

  @override
  Widget build(BuildContext context) => Scaffold(
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
                              itemCount: item['restaurants'].length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                //final Data restoran = [index];
                                //final datas = dataRestaurant[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailMenu(
                                                  angka: index,
                                                )));
                                  },
                                  child: Card(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        height: 100,
                                        color:
                                            Color.fromARGB(255, 203, 245, 247),
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
                                                child: Image.network(
                                                    item['restaurants'][index]
                                                        ['pictureId']),
                                              ),
                                              SizedBox(width: 10),
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      item['restaurants'][index]
                                                          ['name'],
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
                                                          item['restaurants']
                                                              [index]['city'],
                                                          style:
                                                              Theme.of(context)
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
