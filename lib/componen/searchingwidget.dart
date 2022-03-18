import 'package:flutter/material.dart';
import '../model/Searching/searching.dart';
import '../deatail_menu.dart';

class SearchingWidget extends StatefulWidget {
  final bool error;
  final int founded;
  final List<Searching> restaurants;

  const SearchingWidget(this.error, this.founded, this.restaurants, {Key? key})
      : super(key: key);

  @override
  State<SearchingWidget> createState() => _SearchingWidgetState();
}

class _SearchingWidgetState extends State<SearchingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(right: 8, left: 8, bottom: 8, top: 10),
          //color: Color.fromARGB(255, 34, 205, 211),
          child: ListView.builder(
            itemCount: this.widget.restaurants.length,
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
                              idRestorant: this.widget.restaurants[index].id)));
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Image.network(
                                  'https://restaurant-api.dicoding.dev/images/medium/${this.widget.restaurants[index].pictureId}'),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    this.widget.restaurants[index].name,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.location_on),
                                      Text(
                                        this.widget.restaurants[index].city,
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
        ),
      ),
    );
  }
}
