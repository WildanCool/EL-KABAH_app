import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  final String title;

  final String prayerName;

  final String countdown;

  const HomeHeader({
    super.key,
    required this.title,
    required this.prayerName,
    required this.countdown,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: double.infinity,

        height: 250,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),

          image: DecorationImage(
            image: AssetImage("assets/masjid.jpg"),

            fit: BoxFit.cover,

            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.45),
              BlendMode.darken,
            ),
          ),
        ),

        child: Container(
          padding: EdgeInsets.all(28),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),

            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

              colors: [
                Colors.black.withOpacity(0.15),
                Colors.black.withOpacity(0.35),
              ],
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                title,

                style: GoogleFonts.inter(
                  color: Colors.white.withOpacity(0.95),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 4),

              Text(
                prayerName.toUpperCase(),
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 60,
                  height: 1,
                  fontWeight: FontWeight.w900,
                ),
              ),

              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),

                decoration: BoxDecoration(
                  color: Color(0xff99A06B),

                  borderRadius: BorderRadius.circular(16),
                ),

                child: Text(
                  countdown,

                  style: GoogleFonts.inter(
                    color: Colors.white,

                    fontSize: 20,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
