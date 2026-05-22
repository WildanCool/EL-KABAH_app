import 'dart:async';

import 'package:el_kabah_app_backup/pages/quran_page.dart';
import 'package:el_kabah_app_backup/providers/location_provider.dart';
import 'package:el_kabah_app_backup/services/sholat_service.dart';
import 'package:el_kabah_app_backup/utils/sholat_helper.dart';
import 'package:el_kabah_app_backup/widgets/custom_appbar.dart';
import 'package:el_kabah_app_backup/widgets/home/home_header.dart';
import 'package:el_kabah_app_backup/widgets/home/menu_card.dart';
import 'package:el_kabah_app_backup/widgets/home/next_prayer_card.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> sholatTimes = [];

  Timer? timer;

  bool isLoading = true;

  String currentPrayer = "";

  String nextPrayer = "";

  String nextPrayerTime = "";

  String headerTitle = "Sekarang Waktu";

  // ================= LOAD SHOLAT =================

  Future<void> loadSholat() async {
    final locationProvider = Provider.of<LocationProvider>(
      context,
      listen: false,
    );

    try {
      sholatTimes = await SholatServices.getSholatTimes(
        city: locationProvider.city,
        country: locationProvider.country,
      );

      updatePrayerStatus();
    } catch (e) {
      debugPrint("Error HomePage: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  // ================= UPDATE STATUS =================

  void updatePrayerStatus() {
    if (sholatTimes.isEmpty) return;

    DateTime now = DateTime.now();

    for (int i = 0; i < sholatTimes.length; i++) {
      final parts = sholatTimes[i]["time"]!.split(":");

      final prayerTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );

      final difference = now.difference(prayerTime);

      // ================= CURRENT PRAYER =================

      if (difference.inSeconds >= 0 && difference.inHours < 1) {
        currentPrayer = sholatTimes[i]["name"]!;

        headerTitle = "Sekarang Waktu";

        // NEXT PRAYER
        if (i < sholatTimes.length - 1) {
          nextPrayer = sholatTimes[i + 1]["name"]!;

          nextPrayerTime = sholatTimes[i + 1]["time"]!;
        }

        return;
      }

      // ================= AFTER 1 HOUR =================

      if (difference.inHours >= 1) {
        if (i < sholatTimes.length - 1) {
          currentPrayer = sholatTimes[i + 1]["name"]!;

          headerTitle = "Memasuki Waktu Sholat";

          nextPrayer = sholatTimes[i + 1]["name"]!;

          nextPrayerTime = sholatTimes[i + 1]["time"]!;
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadSholat();
    });

    // REALTIME
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updatePrayerStatus();

      setState(() {});
    });
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(),

      extendBodyBehindAppBar: true,

      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/masjid.jpg"),

            fit: BoxFit.cover,

            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.84),
              BlendMode.darken,
            ),
          ),
        ),

        child: SafeArea(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: loadSholat,

                  child: ListView(
                    padding: const EdgeInsets.all(20),

                    children: [
                      // ================= LOCATION =================
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: Colors.greenAccent,
                            size: 20,
                          ),

                          const SizedBox(width: 6),

                          Text(
                            "${locationProvider.city}, ${locationProvider.country}",

                            style: TextStyle(
                              color: Colors.white.withOpacity(0.75),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 22),

                      // ================= HEADER =================
                      HomeHeader(
                        title: headerTitle,

                        prayerName: currentPrayer,

                        countdown: SholatHelper.getSholatStatus(sholatTimes),
                      ),

                      const SizedBox(height: 24),

                      // ================= MENU =================
                      Row(
                        children: [
                          // QURAN
                          MenuCard(
                            title: "Al-Quran",

                            icon: Icons.menu_book_rounded,

                            onTap: () {
                              Navigator.push(
                                context,

                                MaterialPageRoute(
                                  builder: (_) {
                                    return const QuranPage();
                                  },
                                ),
                              );
                            },
                          ),

                          const SizedBox(width: 16),

                          // NEXT PRAYER
                          NextPrayerCard(
                            prayerName: nextPrayer,
                            prayerTime: nextPrayerTime,
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // ================= EXTRA SPACE =================
                      Container(
                        height: 180,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),

                          color: Colors.white.withOpacity(0.05),

                          border: Border.all(color: Colors.white10),
                        ),

                        child: Center(
                          child: Text(
                            "Coming Soon",

                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),

                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
