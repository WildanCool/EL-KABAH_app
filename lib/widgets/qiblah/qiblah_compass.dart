import 'dart:math';

import 'package:el_kabah_app_backup/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';

class QiblahCompass extends StatefulWidget {
  const QiblahCompass({super.key});

  @override
  State<QiblahCompass> createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompass> {
  Future<bool> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkPermission(),

      builder: (context, permissionSnapshot) {
        if (permissionSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.white));
        }

        if (permissionSnapshot.data == false) {
          return Center(
            child: Text(
              "Izin lokasi ditolak",

              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        }

        return StreamBuilder<QiblahDirection>(
          stream: FlutterQiblah.qiblahStream,

          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            final qiblahDirection = snapshot.data!;

            return Center(
              child: SizedBox(
                width: 330,
                height: 330,

                child: Stack(
                  alignment: Alignment.center,

                  children: [
                    // MAIN RING
                    Container(
                      width: 285,
                      height: 285,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        border: Border.all(color: Colors.white38, width: 1.2),
                      ),
                    ),

                    // KA'BAH IMAGE
                    Positioned(
                      top: 2,

                      child: Container(
                        width: 46,
                        height: 46,

                        padding: EdgeInsets.all(8),

                        decoration: BoxDecoration(
                          color: Colors.white,

                          shape: BoxShape.circle,
                        ),

                        child: Image.asset(
                          "assets/kabah.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // NEEDLE
                    Transform.rotate(
                      angle: (qiblahDirection.direction * (pi / 180) * -1),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          Icon(
                            Icons.navigation_rounded,
                            size: 70,
                            color: AppColors.greenLight,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
