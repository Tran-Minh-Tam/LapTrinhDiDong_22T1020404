class Place {
  final String name;
  final String location;
  final double rating;
  final double price;
  final String imageAsset;
  bool isFavorite;
  final bool hasBreakfast;
  final bool lastRoom;

  Place({
    required this.name,
    required this.location,
    required this.rating,
    required this.price,
    required this.imageAsset,
    this.isFavorite = false,
    this.hasBreakfast = false,
    this.lastRoom = false,
  });
}
