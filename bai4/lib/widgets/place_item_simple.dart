import 'package:flutter/material.dart';
import '../models/place.dart';

class PlaceItemSimple extends StatelessWidget {
  final Place place;

  const PlaceItemSimple({required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      child: Row(
        children: [
          Image.asset(
            place.imageAsset,
            width: 120,
            height: 90,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(place.name,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                Text(place.location),
                Text("Giá: \$${place.price.toStringAsFixed(0)}"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
