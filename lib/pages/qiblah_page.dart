import 'package:el_kabah_app_backup/widgets/qiblah/qiblah_compass.dart';
import 'package:flutter/material.dart';

class QiblahPage extends StatelessWidget {
  const QiblahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/masjid.jpg"),

            fit: BoxFit.cover,

            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),

              BlendMode.darken,
            ),
          ),
        ),

        child: SafeArea(child: QiblahCompass()),
      ),
    );
  }
}
