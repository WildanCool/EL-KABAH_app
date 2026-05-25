import 'package:el_kabah_app_backup/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextPrayerCard extends StatelessWidget {
  final String prayerName;

  final String prayerTime;

  const NextPrayerCard({
    super.key,
    required this.prayerName,
    required this.prayerTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 18),
      // height: 100,
      decoration: BoxDecoration(
        color: AppColors.greenDark,

        borderRadius: BorderRadius.circular(18),
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),

        child: Stack(
          children: [
            // MOSQUE IMAGE
            Positioned(
              right: -18,
              bottom: -18,

              child: Image.asset(
                "assets/mosque.png",

                width: 95,

                fit: BoxFit.contain,
              ),
            ),

            // CONTENT
            Padding(
              padding: EdgeInsets.all(14),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    prayerName.toUpperCase(),

                    style: const TextStyle(
                      color: Colors.white,

                      fontSize: 12,

                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  Text(
                    prayerTime,

                    style: GoogleFonts.inter(
                      color: Colors.white,

                      fontSize: 50,

                      height: 1,

                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
