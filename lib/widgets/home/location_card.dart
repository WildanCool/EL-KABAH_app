import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String city;

  final String country;

  const LocationCard({super.key, required this.city, required this.country});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: double.infinity,

        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),

          color: Colors.white,

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),

              blurRadius: 18,

              offset: Offset(0, 6),
            ),
          ],
        ),

        child: Row(
          children: [
            // ICON
            Container(
              width: 54,
              height: 54,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),

                color: Color(0xff80875F).withOpacity(0.12),
              ),

              child: Icon(
                Icons.location_on_rounded,

                color: Color(0xff80875F),

                size: 30,
              ),
            ),

            SizedBox(width: 16),

            // TEXT
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Lokasi Saat Ini",

                    style: TextStyle(
                      color: Colors.grey.shade600,

                      fontSize: 13,

                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  Row(
                    children: [
                      Text(
                        city,

                        maxLines: 1,

                        overflow: TextOverflow.ellipsis,

                        style: TextStyle(
                          color: Colors.black,

                          fontSize: 18,

                          fontWeight: FontWeight.bold,

                          height: 1,
                        ),
                      ),

                      Text(
                        ", ",
                        style: TextStyle(
                          color: Colors.black,
                          height: 1,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        country,

                        style: TextStyle(
                          color: Colors.black,
                          height: 1,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
