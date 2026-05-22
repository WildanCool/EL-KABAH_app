import 'dart:convert';

import 'package:http/http.dart' as http;

class SholatServices {
  static Future<List<Map<String, String>>> getSholatTimes({
    required String city,
    required String country,
  }) async {
    final url = Uri.parse(
      "https://api.aladhan.com/v1/timingsByCity"
      "?city=$city"
      "&country=$country"
      "&method=11",
    );

    final response = await http.get(url);

    final data = jsonDecode(response.body);

    final timings = data["data"]["timings"];

    return [
      {"name": "Subuh", "time": timings["Fajr"]},

      {"name": "Dzuhur", "time": timings["Dhuhr"]},

      {"name": "Ashar", "time": timings["Asr"]},

      {"name": "Maghrib", "time": timings["Maghrib"]},

      {"name": "Isya", "time": timings["Isha"]},
    ];
  }
}
