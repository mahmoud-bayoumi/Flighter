class Hotel {
  final String name;
  final String location;
  final String imageUrl;
  final double rating;
  final int reviews;
  final String ratingText;
  final int nightlyPrice;
  final int totalPrice;
  final int roomsLeft;
  final List<String> amenities;
  final bool isAdultOnly;
  final bool breakfastIncluded;

  Hotel({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    required this.ratingText,
    required this.nightlyPrice,
    required this.totalPrice,
    required this.roomsLeft,
    required this.amenities,
    this.isAdultOnly = false,
    this.breakfastIncluded = false,
  });
}