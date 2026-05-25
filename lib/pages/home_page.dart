import 'dart:async';

import 'package:el_kabah_app_backup/pages/quran_page.dart';
import 'package:el_kabah_app_backup/providers/location_provider.dart';
import 'package:el_kabah_app_backup/services/sholat_service.dart';
import 'package:el_kabah_app_backup/utils/sholat_helper.dart';
import 'package:el_kabah_app_backup/widgets/custom_appbar.dart';
import 'package:el_kabah_app_backup/widgets/home/home_header.dart';
import 'package:el_kabah_app_backup/widgets/home/jadwal_kajian_section.dart';
import 'package:el_kabah_app_backup/widgets/home/location_card.dart';
import 'package:el_kabah_app_backup/widgets/home/motivation_slider_section.dart';
import 'package:el_kabah_app_backup/widgets/home/quran_card.dart';
import 'package:el_kabah_app_backup/widgets/home/next_prayer_card.dart';
import 'package:el_kabah_app_backup/widgets/home/youtube_section.dart';
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

      // CURRENT PRAYER
      if (difference.inSeconds >= 0 && difference.inHours < 1) {
        currentPrayer = sholatTimes[i]["name"]!;

        headerTitle = "Sekarang Waktu";

        if (i < sholatTimes.length - 1) {
          nextPrayer = sholatTimes[i + 1]["name"]!;

          nextPrayerTime = sholatTimes[i + 1]["time"]!;
        }

        return;
      }

      // AFTER 1 HOUR
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

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
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

      backgroundColor: Color(0xffEBEBEB),

      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  SizedBox(height: 18),

                  // ================= LOCATION =================
                  LocationCard(
                    city: locationProvider.city,

                    country: locationProvider.country,
                  ),

                  SizedBox(height: 18),

                  // ================= HEADER =================
                  HomeHeader(
                    title: headerTitle,

                    prayerName: currentPrayer,

                    countdown: SholatHelper.getSholatStatus(sholatTimes),
                  ),

                  SizedBox(height: 16),

                  // ================= MENU =================
                  Row(
                    children: [
                      Expanded(
                        child: QuranCard(
                          title: "AL\nQURAN",

                          icon: Icons.menu_book_rounded,

                          onTap: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(builder: (_) => QuranPage()),
                            );
                          },
                        ),
                      ),

                      SizedBox(width: 12),

                      Expanded(
                        child: NextPrayerCard(
                          prayerName: nextPrayer,

                          prayerTime: nextPrayerTime,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 28),

                  // ================= YOUTUBE =================
                  YoutubeSection(),

                  SizedBox(height: 30),

                  // ================= JADWAL KAJIAN =================
                  JadwalKajianSection(),

                  SizedBox(height: 30),

                  // ================= JADWAL KAJIAN =================
                  MotivationSliderSection(),

                  SizedBox(height: 30),
                ],
              ),
      ),
    );
  }
}
