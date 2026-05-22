import 'dart:async';

import 'package:el_kabah_app_backup/models/city_model.dart';
import 'package:el_kabah_app_backup/services/city_service.dart';
import 'package:el_kabah_app_backup/services/sholat_service.dart';
import 'package:el_kabah_app_backup/utils/sholat_helper.dart';
import 'package:el_kabah_app_backup/widgets/sholat/countdown_card.dart';
import 'package:el_kabah_app_backup/widgets/sholat/sholat_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/location_provider.dart';

class SholatPage extends StatefulWidget {
  const SholatPage({super.key});

  @override
  State<SholatPage> createState() => _SholatPageState();
}

class _SholatPageState extends State<SholatPage> {
  List<Map<String, String>> sholatTimes = [];

  List<CityModel> filteredCities = [];

  final TextEditingController searchController = TextEditingController();

  Timer? timer;
  Timer? debounce;

  bool isLoading = false;

  Future<void> loadSholatTimes() async {
    setState(() {
      isLoading = true;
    });

    try {
      final locationProvider = Provider.of<LocationProvider>(
        context,
        listen: false,
      );

      sholatTimes = await SholatServices.getSholatTimes(
        city: locationProvider.city,
        country: locationProvider.country,
      );
    } catch (e) {
      debugPrint("Error load sholat: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  void searchCity(String value) async {
    if (value.isEmpty) {
      setState(() {
        filteredCities = [];
      });

      return;
    }

    if (debounce?.isActive ?? false) {
      debounce!.cancel();
    }

    debounce = Timer(Duration(milliseconds: 500), () async {
      final result = await CityService.searchCity(value);

      setState(() {
        filteredCities = result;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    loadSholatTimes();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer?.cancel();

    debounce?.cancel();

    searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String currentSholat = "";

    DateTime now = DateTime.now();

    for (int i = 0; i < sholatTimes.length; i++) {
      List<String> parts = sholatTimes[i]["time"]!.split(":");

      DateTime sholatTime = DateTime(
        now.year,
        now.month,
        now.day,

        int.parse(parts[0]),
        int.parse(parts[1]),
      );

      if (i < sholatTimes.length - 1) {
        List<String> nextParts = sholatTimes[i + 1]["time"]!.split(":");

        DateTime nextSholat = DateTime(
          now.year,
          now.month,
          now.day,

          int.parse(nextParts[0]),
          int.parse(nextParts[1]),
        );

        if (now.isAfter(sholatTime) && now.isBefore(nextSholat)) {
          currentSholat = sholatTimes[i]["name"]!;
        }
      }
    }

    return Scaffold(
      // appBar: CustomAppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/masjid.jpg'),

            fit: BoxFit.cover,

            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),

              BlendMode.darken,
            ),
          ),
        ),

        child: SafeArea(
          child: Stack(
            children: [
              // ================= MAIN CONTENT =================
              Column(
                children: [
                  // SEARCH BAR
                  Padding(
                    padding: EdgeInsets.all(20),

                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search city...",
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),

                          borderSide: BorderSide.none,
                        ),
                      ),

                      onChanged: searchCity,
                    ),
                  ),

                  // SHOLAT CARD
                  Expanded(
                    child: Center(
                      child: Stack(
                        clipBehavior: Clip.none,

                        children: [
                          if (isLoading)
                            Container(
                              width: 250,
                              height: 316,

                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),

                                borderRadius: BorderRadius.circular(24),
                              ),
                            )
                          else
                            SholatCard(
                              sholatTimes: sholatTimes,

                              currentSholat: currentSholat,
                            ),

                          if (!isLoading)
                            CountdownCard(
                              currentSholatName: SholatHelper.currentSholatName,

                              sholatStatus: SholatHelper.getSholatStatus(
                                sholatTimes,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // ================= FLOATING DROPDOWN =================
              if (filteredCities.isNotEmpty)
                Positioned(
                  top: 90,
                  left: 20,
                  right: 20,

                  child: Material(
                    elevation: 15,

                    borderRadius: BorderRadius.circular(16),

                    child: Container(
                      constraints: BoxConstraints(maxHeight: 250),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: ListView.builder(
                        shrinkWrap: true,

                        itemCount: filteredCities.length,

                        itemBuilder: (context, index) {
                          final city = filteredCities[index];

                          return ListTile(
                            leading: Icon(Icons.location_on_rounded),

                            title: Text("${city.city}, ${city.country}"),

                            onTap: () async {
                              await Provider.of<LocationProvider>(
                                context,
                                listen: false,
                              ).setLocation(
                                newCity: city.city,
                                newCountry: city.country,
                              );

                              searchController.clear();

                              filteredCities = [];

                              FocusScope.of(context).unfocus();

                              await loadSholatTimes();

                              setState(() {});
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
