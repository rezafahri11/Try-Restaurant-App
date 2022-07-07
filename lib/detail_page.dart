import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:try_app/restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_details';

  final RestaurantElement restaurant;

  const RestaurantDetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(restaurant.pictureId),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: Colors.black12,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Center(
                        child: Column(
                          children: [
                            Icon(Icons.pin_drop),
                            Text(restaurant.city)
                          ],
                        ),
                      ),
                      Spacer(),
                      Center(
                        child: Column(
                          children: [
                            Icon(Icons.star),
                            Text(restaurant.rating.toString()),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    restaurant.description,
                    style: TextStyle(fontSize: 15),
                  ),
                  Divider(color: Colors.grey),
                  Text("Menus",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Divider(
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      Spacer(flex: 1),
                      Column(
                        children: [
                          Text(
                            "Foods List",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          SingleChildScrollView(
                            child: Column(children: [
                              ListView(children: [Text(restaurant.name)])
                            ]),
                          ),
                        ],
                      ),
                      Spacer(flex: 2),
                      Column(
                        children: [
                          Text(
                            "Drinks List",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Text("Data 1"),
                        ],
                      ),
                      Spacer(
                        flex: 1,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
