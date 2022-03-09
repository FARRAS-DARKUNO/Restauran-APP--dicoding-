import 'package:flutter/material.dart';
import 'text_theme.dart';
import 'model/temporary.dart';

class DetailMenu extends StatelessWidget {
  Map item = data;
  final int angka;
  DetailMenu({required this.angka});
  @override
  Widget build(BuildContext context) => Scaffold(
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
                          item['restaurants'][angka]['pictureId']),
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
                      item['restaurants'][angka]['name'],
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          item['restaurants'][angka]['city'],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  item['restaurants'][angka]['description'],
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
                              itemCount: item['restaurants'][angka]['menus']
                                      ['foods']
                                  .length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  child: Card(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Text(item['restaurants'][angka]
                                          ['menus']['foods'][index]['name']),
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
                              itemCount: item['restaurants'][angka]['menus']
                                      ['drinks']
                                  .length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  child: Card(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Text(item['restaurants'][angka]
                                          ['menus']['drinks'][index]['name']),
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
