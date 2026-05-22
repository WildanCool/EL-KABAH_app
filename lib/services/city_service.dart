import 'dart:convert';

import 'package:el_kabah_app_backup/models/city_model.dart';
import 'package:http/http.dart' as http;

class CityService {
  static Future<List<CityModel>> searchCity(String keyword) async {
    if (keyword.isEmpty) {
      return [];
    }

    final url = Uri.parse(
      "https://wft-geo-db.p.rapidapi.com/v1/geo/cities"
      "?namePrefix=$keyword"
      "&limit=10",
    );

    final response = await http.get(
      url,

      headers: {
        "X-RapidAPI-Key": "ac5212ba9bmshe4069a8d0ea7b81p16e827jsn16a08cf7f36c",

        "X-RapidAPI-Host": "wft-geo-db.p.rapidapi.com",
      },
    );

    final data = jsonDecode(response.body);

    final List cities = data["data"];

    return cities.map((city) {
      return CityModel(city: city["city"], country: city["country"]);
    }).toList();
  }
}
