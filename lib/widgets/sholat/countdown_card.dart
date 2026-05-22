import 'package:el_kabah_app_backup/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountdownCard extends StatelessWidget {
  final String currentSholatName;
  final String sholatStatus;

  const CountdownCard({
    super.key,
    required this.currentSholatName,
    required this.sholatStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,

      child: Container(
        width: double.infinity,

        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),

        decoration: BoxDecoration(
          color: AppColors.greenMedium,

          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(
              currentSholatName,

              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              sholatStatus,

              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
