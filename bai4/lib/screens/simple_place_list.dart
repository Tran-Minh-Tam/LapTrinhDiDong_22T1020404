import 'package:flutter/material.dart';
import '../models/place.dart';
import '../widgets/place_item_simple.dart';

class SimplePlaceList extends StatelessWidget {

  final List<Place> places = [
    Place(
      name: "AnhHill Boutique",
      location: "Huế",
      rating: 9.5,
      price: 109,
      imageAsset: "assets/images/hotel.jpg",
    ),
    Place(
      name: "An Nam Huế Boutique",
      location: "Cự Chính",
      rating: 9.2,
      price: 20,
      imageAsset: "assets/images/room1.jpg",
    ),
    Place(
      name: "Huế Jade Hill Villa",
      location: "Cự Chính",
      rating: 8.0,
      price: 285,
      imageAsset: "assets/images/villa.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Danh Sách Phòng")),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (_, index) {
          return PlaceItemSimple(place: places[index]);
        },
      ),
    );
  }
}
