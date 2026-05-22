import 'package:el_kabah_app_backup/datas/doa_data.dart';
import 'package:el_kabah_app_backup/datas/dzikir_data.dart';
import 'package:el_kabah_app_backup/datas/hadits_data.dart';
import 'package:el_kabah_app_backup/models/amalan_model.dart';
import 'package:el_kabah_app_backup/pages/detail_amalan_page.dart';
import 'package:el_kabah_app_backup/services/amalan_service.dart';
import 'package:el_kabah_app_backup/theme/theme.dart';
import 'package:el_kabah_app_backup/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AmalanPage extends StatefulWidget {
  const AmalanPage({super.key});

  @override
  State<AmalanPage> createState() => _AmalanPageState();
}

class _AmalanPageState extends State<AmalanPage> {
  Map<String, List<AmalanModel>> groupedAmalan = {};

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    setupData();
  }

  Future<void> setupData() async {
    final data = await AmalanService.getAmalan();

    if (data.isEmpty) {
      for (var item in dzikirData) {
        await AmalanService.insertAmalan(item);
      }

      for (var item in doaData) {
        await AmalanService.insertAmalan(item);
      }

      for (var item in haditsData) {
        await AmalanService.insertAmalan(item);
      }
    }

    await loadData();
  }

  Future<void> loadData() async {
    final data = await AmalanService.getAmalan();

    groupedAmalan = {};

    for (var item in data) {
      if (!groupedAmalan.containsKey(item.category)) {
        groupedAmalan[item.category] = [];
      }

      groupedAmalan[item.category]!.add(item);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Color(0xFFEAEAEA),

      appBar: CustomAppBar(),

      body: ListView(
        padding: EdgeInsets.all(18),

        children: groupedAmalan.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 14, top: 10),

                child: Text(
                  entry.key,

                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,

                    color: AppColors.greenDark,
                  ),
                ),
              ),

              ...entry.value.map((item) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16),

                  padding: EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) => DetailAmalanPage(item: item),
                        ),
                      );
                    },

                    child: Row(
                      children: [
                        Image.asset("assets/tasbih.png", width: 28),

                        SizedBox(width: 14),

                        Expanded(
                          child: Text(
                            item.title,

                            style: GoogleFonts.inter(
                              fontSize: 18,

                              fontWeight: FontWeight.w600,

                              color: Color(0xFF8A9065),
                            ),
                          ),
                        ),

                        Icon(Icons.arrow_forward_ios_rounded, size: 20),
                      ],
                    ),
                  ),
                );
              }),
            ],
          );
        }).toList(),
      ),
    );
  }
}
