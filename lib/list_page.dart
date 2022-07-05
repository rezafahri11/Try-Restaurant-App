import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:try_app/restaurant.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/article_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant'),
      ),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/articles.json'),
        builder: (context, snapshot) {
          final restaurant = restaurantFromJson('assets/articles.json');
          return ListView.builder(
            itemCount: json.length ,
            itemBuilder: (context, index) {
              return _buildArticleItem(context, [index]);
            },
          );
        },
      ),
    );
  }
}

Widget _buildArticleItem(BuildContext context, RestaurantElement restaurantElement) {
  return ListTile(
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
    leading: Image.network(
      restaurantElement.pictureId,
      width: 100,
    ),
    title: Text(restaurantElement.name),
    subtitle: Text(restaurantElement.city),
  );
}
