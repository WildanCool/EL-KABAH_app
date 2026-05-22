import 'package:el_kabah_app_backup/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SholatCard extends StatelessWidget {
  final List<Map<String, String>> sholatTimes;
  final String currentSholat;

  const SholatCard({
    super.key,
    required this.sholatTimes,
    required this.currentSholat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: EdgeInsets.fromLTRB(24, 16, 24, 70),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.45),
        borderRadius: BorderRadius.circular(24),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          ...sholatTimes.map((sholat) {
            bool isActive = sholat["name"] == currentSholat;

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    sholat["name"]!,

                    style: GoogleFonts.inter(
                      fontSize: 18,

                      color: isActive ? AppColors.greenLight : Colors.white,

                      fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),

                  Text(
                    sholat["time"]!,

                    style: GoogleFonts.inter(
                      fontSize: 18,

                      color: isActive ? AppColors.greenLight : Colors.white,

                      fontWeight: isActive
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
