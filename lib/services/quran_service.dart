import 'dart:convert';

import 'package:el_kabah_app_backup/models/ayat_model.dart';
import 'package:el_kabah_app_backup/models/surat_model.dart';

import 'package:http/http.dart' as http;

class QuranService {

  // ================= LIST SURAT =================

  static Future<List<SuratModel>>
  getAllSurah() async {

    final url = Uri.parse(
      "https://equran.id/api/v2/surat",
    );

    final response =
        await http.get(url);

    final data =
        jsonDecode(response.body);

    final List suratList =
        data["data"];

    return suratList.map((e) {

      return SuratModel.fromJson(e);

    }).toList();
  }

  // ================= DETAIL SURAT =================

  static Future<List<AyatModel>>
  getDetailSurah(int nomor) async {

    final url = Uri.parse(
      "https://equran.id/api/v2/surat/$nomor",
    );

    final response =
        await http.get(url);

    final data =
        jsonDecode(response.body);

    final List ayatList =
        data["data"]["ayat"];

    return ayatList.map((e) {

      return AyatModel.fromJson(e);

    }).toList();
  }
}