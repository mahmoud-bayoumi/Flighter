import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'data/model/hotel_model.dart';
import 'presentation/views/widgets/hotel_card.dart';

class HotelsListView extends StatelessWidget {
  final String toCountry;
  final List<Hotel> hotels;

  HotelsListView({super.key, required this.toCountry})
      : hotels = [
          Hotel(
            name: "Ali Pasha Hotel",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&h=250&fit=crop",
            rating: 8.2,
            reviews: 98,
            ratingText: "Very Good",
            nightlyPrice: 159,
            totalPrice: 205,
            roomsLeft: 1,
            amenities: ["Pool"],
          ),
          Hotel(
            name: "Three Corners Ocean View Hotel Prestige",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=250&fit=crop",
            rating: 8.8,
            reviews: 287,
            ratingText: "Excellent",
            nightlyPrice: 153,
            totalPrice: 202,
            roomsLeft: 2,
            amenities: ["Pool", "Breakfast included"],
            isAdultOnly: true,
            breakfastIncluded: true,
          ),
          Hotel(
            name: "Burj Al Arab Jumeirah",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=400&h=250&fit=crop",
            rating: 9.2,
            reviews: 542,
            ratingText: "Exceptional",
            nightlyPrice: 1200,
            totalPrice: 1350,
            roomsLeft: 3,
            amenities: ["Pool", "Spa", "Beach Access"],
          ),
          Hotel(
            name: "Hotel Plaza Athénée",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1549294413-26f195200c16?w=400&h=250&fit=crop",
            rating: 9.0,
            reviews: 324,
            ratingText: "Exceptional",
            nightlyPrice: 850,
            totalPrice: 950,
            roomsLeft: 2,
            amenities: ["Spa", "Restaurant"],
            breakfastIncluded: true,
          ),
          Hotel(
            name: "The Ritz-Carlton",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=400&h=250&fit=crop",
            rating: 8.9,
            reviews: 456,
            ratingText: "Excellent",
            nightlyPrice: 650,
            totalPrice: 720,
            roomsLeft: 4,
            amenities: ["Spa", "Restaurant", "City View"],
          ),
          Hotel(
            name: "Santorini Grace Hotel",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1613395877344-13d4a8e0d49e?w=400&h=250&fit=crop",
            rating: 9.1,
            reviews: 189,
            ratingText: "Exceptional",
            nightlyPrice: 420,
            totalPrice: 485,
            roomsLeft: 1,
            amenities: ["Pool", "Sea View"],
            isAdultOnly: true,
          ),
          Hotel(
            name: "Copacabana Palace",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&h=250&fit=crop",
            rating: 8.7,
            reviews: 398,
            ratingText: "Excellent",
            nightlyPrice: 380,
            totalPrice: 425,
            roomsLeft: 3,
            amenities: ["Pool", "Beach Access", "Spa"],
          ),
          Hotel(
            name: "The Savoy London",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=250&fit=crop",
            rating: 8.8,
            reviews: 612,
            ratingText: "Excellent",
            nightlyPrice: 720,
            totalPrice: 800,
            roomsLeft: 2,
            amenities: ["Spa", "Restaurant", "Thames View"],
            breakfastIncluded: true,
          ),
          Hotel(
            name: "Marina Bay Sands",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&h=250&fit=crop",
            rating: 8.6,
            reviews: 834,
            ratingText: "Excellent",
            nightlyPrice: 340,
            totalPrice: 380,
            roomsLeft: 5,
            amenities: ["Pool", "Casino", "Shopping"],
          ),
          Hotel(
            name: "The Plaza Hotel",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=400&h=250&fit=crop",
            rating: 8.4,
            reviews: 567,
            ratingText: "Very Good",
            nightlyPrice: 550,
            totalPrice: 625,
            roomsLeft: 3,
            amenities: ["Spa", "Restaurant", "Central Park View"],
          ),
          Hotel(
            name: "Hotel Danieli Venice",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1523906834658-6e24ef2386f9?w=400&h=250&fit=crop",
            rating: 8.9,
            reviews: 289,
            ratingText: "Excellent",
            nightlyPrice: 480,
            totalPrice: 540,
            roomsLeft: 2,
            amenities: ["Restaurant", "Canal View", "Historic"],
            breakfastIncluded: true,
          ),
          Hotel(
            name: "Atlantis The Palm",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&h=250&fit=crop",
            rating: 8.3,
            reviews: 756,
            ratingText: "Very Good",
            nightlyPrice: 280,
            totalPrice: 320,
            roomsLeft: 6,
            amenities: ["Pool", "Waterpark", "Beach Access"],
          ),
          Hotel(
            name: "Four Seasons",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=400&h=250&fit=crop",
            rating: 9.0,
            reviews: 234,
            ratingText: "Exceptional",
            nightlyPrice: 320,
            totalPrice: 365,
            roomsLeft: 4,
            amenities: ["Pool", "Spa", "Beach Access"],
          ),
          Hotel(
            name: "The St. Regis",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400&h=250&fit=crop",
            rating: 9.3,
            reviews: 156,
            ratingText: "Exceptional",
            nightlyPrice: 890,
            totalPrice: 980,
            roomsLeft: 2,
            amenities: ["Pool", "Overwater Villa", "Spa"],
            isAdultOnly: true,
          ),
          Hotel(
            name: "Raffles Hotel",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=400&h=250&fit=crop",
            rating: 8.7,
            reviews: 423,
            ratingText: "Excellent",
            nightlyPrice: 450,
            totalPrice: 510,
            roomsLeft: 3,
            amenities: ["Pool", "Spa", "Historic"],
            breakfastIncluded: true,
          ),
          Hotel(
            name: "Château Marmont",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=250&fit=crop",
            rating: 8.1,
            reviews: 312,
            ratingText: "Very Good",
            nightlyPrice: 620,
            totalPrice: 695,
            roomsLeft: 1,
            amenities: ["Pool", "Restaurant", "Celebrity Hideaway"],
          ),
          Hotel(
            name: "Taj Lake Palace",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=400&h=250&fit=crop",
            rating: 8.8,
            reviews: 267,
            ratingText: "Excellent",
            nightlyPrice: 340,
            totalPrice: 385,
            roomsLeft: 2,
            amenities: ["Pool", "Lake View", "Palace"],
          ),
          Hotel(
            name: "Hotel del Coronado",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&h=250&fit=crop",
            rating: 8.5,
            reviews: 589,
            ratingText: "Very Good",
            nightlyPrice: 420,
            totalPrice: 475,
            roomsLeft: 4,
            amenities: ["Pool", "Beach Access", "Historic"],
          ),
          Hotel(
            name: "Aman ",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1560703616-4f7dc5a1b7b3?w=400&h=250&fit=crop",
            rating: 9.1,
            reviews: 145,
            ratingText: "Exceptional",
            nightlyPrice: 780,
            totalPrice: 860,
            roomsLeft: 1,
            amenities: ["Spa", "City View", "Minimalist"],
            isAdultOnly: true,
          ),
          Hotel(
            name: "Hotel Fasano Rio",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&h=250&fit=crop",
            rating: 8.6,
            reviews: 234,
            ratingText: "Excellent",
            nightlyPrice: 290,
            totalPrice: 335,
            roomsLeft: 3,
            amenities: ["Pool", "Beach Access", "Rooftop"],
          ),
          Hotel(
            name: "The Langham Sydney",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=250&fit=crop",
            rating: 8.7,
            reviews: 456,
            ratingText: "Excellent",
            nightlyPrice: 380,
            totalPrice: 425,
            roomsLeft: 5,
            amenities: ["Pool", "Spa", "Harbor View"],
            breakfastIncluded: true,
          ),
          Hotel(
            name: "Belmond Hotel Caruso",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1602002418082-a4443e081dd1?w=400&h=250&fit=crop",
            rating: 9.0,
            reviews: 178,
            ratingText: "Exceptional",
            nightlyPrice: 650,
            totalPrice: 720,
            roomsLeft: 2,
            amenities: ["Pool", "Sea View", "Terrace"],
          ),
          Hotel(
            name: "Mandarin Oriental",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&h=250&fit=crop",
            rating: 8.9,
            reviews: 623,
            ratingText: "Excellent",
            nightlyPrice: 220,
            totalPrice: 255,
            roomsLeft: 6,
            amenities: ["Pool", "Spa", "River View"],
          ),
          Hotel(
            name: "Grand Hotel Tremezzo",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1578774204375-826dc5d996ed?w=400&h=250&fit=crop",
            rating: 8.8,
            reviews: 289,
            ratingText: "Excellent",
            nightlyPrice: 520,
            totalPrice: 580,
            roomsLeft: 3,
            amenities: ["Pool", "Lake View", "Gardens"],
            breakfastIncluded: true,
          ),
          Hotel(
            name: "The Oberoi Amarvilas",
            location: toCountry,
            imageUrl:
                "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=400&h=250&fit=crop",
            rating: 9.2,
            reviews: 134,
            ratingText: "Exceptional",
            nightlyPrice: 420,
            totalPrice: 475,
            roomsLeft: 2,
            amenities: ["Pool", "Taj Mahal View", "Luxury"],
          ),
        ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title:
            const Text('Hotels', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                _showDirectDialog(context);
              },
              child: HotelCard(hotel: hotels[index]));
        },
      ),
    );
  }

  Future<void> _showDirectDialog(BuildContext context) async {
    final fallbackUrl = Uri.parse(
        'https://play.google.com/store/apps/details?id=com.hcom.android');
    final marketUrl = Uri.parse('market://details?id=com.hcom.android');

    return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Complete Your Hotel Booking'),
        content: const Text(
          'To complete your hotel booking, please download the app from the Google Play Store. '
          'Click "Proceed" to be redirected to the app download page.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
              if (await canLaunchUrl(marketUrl)) {
                await launchUrl(marketUrl,
                    mode: LaunchMode.externalApplication);
              } else if (await canLaunchUrl(fallbackUrl)) {
                await launchUrl(fallbackUrl,
                    mode: LaunchMode.externalApplication);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Could not open the Play Store.')),
                );
              }
            },
            child: const Text('Proceed'),
          ),
        ],
      ),
    );
  }
}
