import 'package:flutter/material.dart';

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
    return Expanded(
      child: Container(
        height: 150,

        padding: const EdgeInsets.all(22),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),

          color: Colors.white.withOpacity(0.07),

          border: Border.all(color: Colors.white10),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Container(
              width: 50,
              height: 50,

              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.12),

                borderRadius: BorderRadius.circular(16),
              ),

              child: const Icon(
                Icons.access_time_rounded,

                color: Colors.blueAccent,
                size: 28,
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  "Next Prayer",

                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),

                const SizedBox(height: 6),

                Text(
                  prayerName,

                  style: const TextStyle(
                    color: Colors.white,

                    fontSize: 20,

                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  prayerTime,

                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
