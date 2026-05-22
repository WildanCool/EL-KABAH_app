import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String title;

  final IconData icon;

  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,

        borderRadius: BorderRadius.circular(24),

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
                  color: Colors.greenAccent.withOpacity(0.12),

                  borderRadius: BorderRadius.circular(16),
                ),

                child: Icon(icon, color: Colors.greenAccent, size: 28),
              ),

              Text(
                title,

                style: const TextStyle(
                  color: Colors.white,

                  fontSize: 18,

                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
