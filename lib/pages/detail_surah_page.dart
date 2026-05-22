import 'package:el_kabah_app_backup/models/ayat_model.dart';
import 'package:el_kabah_app_backup/models/surat_model.dart';

import 'package:el_kabah_app_backup/services/quran_service.dart';

import 'package:el_kabah_app_backup/widgets/quran/ayat_card.dart';

import 'package:flutter/material.dart';

class DetailSurahPage extends StatefulWidget {
  final SuratModel surat;

  const DetailSurahPage({super.key, required this.surat});

  @override
  State<DetailSurahPage> createState() => _DetailSurahPageState();
}

class _DetailSurahPageState extends State<DetailSurahPage> {
  List<AyatModel> ayatList = [];

  bool isLoading = true;

  Future<void> loadAyat() async {
    ayatList = await QuranService.getDetailSurah(widget.surat.nomor);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    loadAyat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surat.namaLatin),

        backgroundColor: Colors.transparent,

        elevation: 0,
      ),

      extendBodyBehindAppBar: true,

      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/masjid.jpg"),

            fit: BoxFit.cover,

            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.88),

              BlendMode.darken,
            ),
          ),
        ),

        child: SafeArea(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  padding: const EdgeInsets.all(20),

                  children: [
                    Text(
                      widget.surat.nama,

                      textAlign: TextAlign.center,

                      style: const TextStyle(
                        color: Colors.white,

                        fontSize: 34,

                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      widget.surat.arti,

                      textAlign: TextAlign.center,

                      style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    ),

                    const SizedBox(height: 30),

                    ...ayatList.map((ayat) {
                      return AyatCard(ayat: ayat);
                    }).toList(),
                  ],
                ),
        ),
      ),
    );
  }
}
