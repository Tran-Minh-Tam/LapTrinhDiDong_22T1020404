import 'package:flutter/material.dart';
import '../models/place.dart';

class PlaceItemComplex extends StatefulWidget {
  final Place place;

  const PlaceItemComplex({required this.place});

  @override
  State<PlaceItemComplex> createState() => _PlaceItemComplexState();
}

class _PlaceItemComplexState extends State<PlaceItemComplex> {
  @override
  Widget build(BuildContext context) {
    final p = widget.place;

    return Card(
      elevation: 4,
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ---------- IMAGE + FAVORITE ----------
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    p.imageAsset,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  right: 6,
                  top: 6,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        p.isFavorite = !p.isFavorite;
                      });
                    },
                    child: Icon(
                      p.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.redAccent,
                      size: 26,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            // ---------- BREAKFAST BADGE ----------
            if (p.hasBreakfast)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "Bao bữa sáng",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),

            SizedBox(height: 6),

            // ---------- NAME ----------
            Text(
              p.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            // ---------- LOCATION ----------
            Text(
              p.location,
              style: TextStyle(color: Colors.grey[700]),
            ),

            SizedBox(height: 6),

            // ---------- RATING ----------
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    p.rating.toString(),
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  p.rating >= 9 ? "Tuyệt vời" : "Rất tốt",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),

            SizedBox(height: 6),

            // ---------- LAST ROOM ----------
            if (p.lastRoom)
              Text(
                "Chỉ còn 1 căn giá này!",
                style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),

            SizedBox(height: 6),

            // ---------- PRICE ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${p.price.toStringAsFixed(0)} / đêm",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Đã bao gồm thuế và phí",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
