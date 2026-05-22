import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LocationProvider extends ChangeNotifier {
  String city = "Jakarta";

  String country = "Indonesia";

  // LOAD SAVED DATA
  Future<void> loadLocation() async {
    final prefs = await SharedPreferences.getInstance();

    city = prefs.getString("city") ?? "Jakarta";

    country = prefs.getString("country") ?? "Indonesia";

    notifyListeners();
  }

  // CHANGE LOCATION
  Future<void> setLocation({
    required String newCity,
    required String newCountry,
  }) async {
    city = newCity;

    country = newCountry;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("city", city);

    await prefs.setString("country", country);

    notifyListeners();
  }
}
