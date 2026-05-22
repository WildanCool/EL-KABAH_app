import 'package:el_kabah_app_backup/models/surat_model.dart';

import 'package:el_kabah_app_backup/pages/detail_surah_page.dart';

import 'package:el_kabah_app_backup/services/quran_service.dart';

import 'package:el_kabah_app_backup/widgets/quran/surat_tile.dart';

import 'package:flutter/material.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() =>
      _QuranPageState();
}

class _QuranPageState
    extends State<QuranPage> {

  List<SuratModel> surahList = [];

  bool isLoading = true;

  Future<void> loadSurah() async {

    surahList =
        await QuranService.getAllSurah();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    loadSurah();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Al-Quran"),

        backgroundColor:
            Colors.transparent,

        elevation: 0,
      ),

      extendBodyBehindAppBar: true,

      body: Container(

        width: double.infinity,
        height: double.infinity,

        decoration: BoxDecoration(

          image: DecorationImage(

            image: const AssetImage(
              "assets/masjid.jpg",
            ),

            fit: BoxFit.cover,

            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.82),

              BlendMode.darken,
            ),
          ),
        ),

        child: SafeArea(

          child: isLoading

              ? const Center(
                  child:
                      CircularProgressIndicator(),
                )

              : ListView.builder(

                  padding:
                      const EdgeInsets.all(20),

                  itemCount:
                      surahList.length,

                  itemBuilder: (
                    context,
                    index,
                  ) {

                    final surat =
                        surahList[index];

                    return SuratTile(

                      surat: surat,

                      onTap: () {

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) {

                              return DetailSurahPage(
                                surat: surat,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}