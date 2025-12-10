import 'package:flutter/material.dart';
import '../models/place.dart';
import '../widgets/place_item_complex.dart';

class ComplexPlaceList extends StatelessWidget {
  final List<Place> places = [
    Place(
    name: "AnhHill Boutique",
    location: "Huế · Cách bạn 0.6km",
    rating: 9.5,
    price: 109,
    imageAsset: "assets/images/hotel.jpg",
    hasBreakfast: true,
    lastRoom: false,
  ),
  Place(
    name: "An Nam Huế Boutique",
    location: "Cự Chính · 0.9km",
    rating: 9.2,
    price: 20,
    imageAsset: "assets/images/room2.jpg",
    hasBreakfast: true,
    lastRoom: true,
  ),
  Place(
    name: "Huế Jade Hill Villa",
    location: "Cự Chính · 1.3km",
    rating: 8.0,
    price: 285,
    imageAsset: "assets/images/villa.jpg",
    hasBreakfast: false,
    lastRoom: false,
  ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Danh Sách Phòng Chi Tiết")),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (_, index) {
          return PlaceItemComplex(place: places[index]);
        },
      ),
    );
  }
}
