import 'package:el_kabah_app_backup/models/ayat_model.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AyatCard extends StatelessWidget {
  final AyatModel ayat;

  const AyatCard({super.key, required this.ayat});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),

        borderRadius: BorderRadius.circular(22),

        border: Border.all(color: Colors.white10),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,

                decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.15),

                  shape: BoxShape.circle,
                ),

                child: Center(
                  child: Text(
                    ayat.nomorAyat.toString(),

                    style: const TextStyle(
                      color: Colors.greenAccent,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,

            child: Text(
              ayat.arab,

              textAlign: TextAlign.right,

              style: GoogleFonts.amiri(
                color: Colors.white,

                fontSize: 28,

                height: 2,
              ),
            ),
          ),

          const SizedBox(height: 18),

          Text(
            ayat.latin,

            style: TextStyle(
              color: Colors.white.withOpacity(0.7),

              fontSize: 14,

              fontStyle: FontStyle.italic,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            ayat.arti,

            style: const TextStyle(
              color: Colors.white,

              fontSize: 15,

              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}
