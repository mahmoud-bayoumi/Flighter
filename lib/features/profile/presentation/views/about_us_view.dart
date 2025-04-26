import 'package:flighter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          'About Us',
          style: TextStyle(fontSize: 32.sp, color: Colors.white),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Welcome to Flighter, your go-to flight booking companion! We believe that planning your travel should be simple, stress-free, and enjoyable. Our mission is to make air travel accessible to everyone, whether you\'re a seasoned globetrotter or planning your first getaway.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'At Flighter, we offer a user-friendly platform that allows you to effortlessly search, compare, and book flights from a wide range of airlines. With real-time updates and an intuitive interface, finding the best deals and managing your bookings has never been easier.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Why choose us?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '- Simplicity: Our app is designed with you in mind, making the booking process quick and straightforward.\n'
                '- Best Prices: We constantly update our listings to ensure you get the best prices available.\n'
                '- 24/7 Support: Our dedicated customer support team is always here to help, no matter where you are in your travel journey.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Join our community of travelers today and let Flighter help you take to the skies with confidence and ease. Happy flying! ✈️',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
