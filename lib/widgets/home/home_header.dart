import 'package:flutter/material.dart';

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
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(28),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

          colors: [
            Colors.white.withOpacity(0.10),

            Colors.white.withOpacity(0.04),
          ],
        ),

        border: Border.all(color: Colors.white10),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            title,

            style: TextStyle(
              color: Colors.white.withOpacity(0.7),

              fontSize: 16,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            prayerName,

            style: const TextStyle(
              color: Colors.white,

              fontSize: 36,

              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 22),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),

            decoration: BoxDecoration(
              color: Colors.greenAccent.withOpacity(0.14),

              borderRadius: BorderRadius.circular(20),

              border: Border.all(color: Colors.greenAccent.withOpacity(0.2)),
            ),

            child: Text(
              countdown,

              style: const TextStyle(
                color: Colors.greenAccent,

                fontSize: 30,

                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
