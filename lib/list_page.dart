import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:try_app/detail_page.dart';
import 'package:try_app/restaurant.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restaurants_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant'),
      ),
      body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString("assets/restaurants.json"),
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              final restaurant = restaurantFromJson(snapshot.data.toString());
              return ListView.builder(
                  itemCount: restaurant.restaurants.length,
                  itemBuilder: (context, index) {
                    return _buildRestaurantItem(
                        context, restaurant.restaurants[index]);
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

Widget _buildRestaurantItem(
    BuildContext context, RestaurantElement restaurantElement) {
  return ListTile(
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
    leading: Image.network(
      restaurantElement.pictureId,
      width: 100,
    ),
    title: Text(
      restaurantElement.name,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    ),
    subtitle: Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.pin_drop,
              size: 15,
            ),
            Spacer(flex: 1),
            Text(
              restaurantElement.city,
              style: TextStyle(fontSize: 15),
            ),
            Spacer(flex: 50),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              size: 15,
            ),
            Spacer(flex: 1),
            Text(
              restaurantElement.rating.toString(),
              style: TextStyle(fontSize: 15),
            ),
            Spacer(flex: 50),
          ],
        ),
      ],
    ),
    onTap: () {
      Navigator.pushNamed(context, RestaurantDetailPage.routeName,
          arguments: restaurantElement,);}
  );
}
