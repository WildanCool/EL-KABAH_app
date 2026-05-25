import 'package:flutter/material.dart';

class QuranCard extends StatelessWidget {
  final String title;

  final IconData icon;

  final VoidCallback onTap;

  const QuranCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(18),

      child: Container(
        margin: EdgeInsets.only(left: 18),
        height: 95,

        decoration: BoxDecoration(
          color: const Color(0xff80875F),

          borderRadius: BorderRadius.circular(18),
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),

          child: Stack(
            children: [
              // QURAN IMAGE
              Positioned(
                right: -18,
                bottom: -25,

                child: Image.asset(
                  "assets/quran.png",

                  width: 95,

                  fit: BoxFit.contain,
                ),
              ),
              // TEXT
              Padding(
                padding: const EdgeInsets.all(14),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text(
                      "AL",

                      style: TextStyle(
                        color: Colors.white,

                        height: 0.9,

                        fontSize: 20,

                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 2),

                    const Text(
                      "QURAN",

                      style: TextStyle(
                        color: Colors.white,

                        height: 0.9,

                        fontSize: 42,

                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
