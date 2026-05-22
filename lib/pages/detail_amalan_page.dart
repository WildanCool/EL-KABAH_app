import 'package:el_kabah_app_backup/models/amalan_model.dart';
import 'package:el_kabah_app_backup/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailAmalanPage extends StatelessWidget {
  final AmalanModel item;

  const DetailAmalanPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenDark,
        surfaceTintColor: Colors.transparent,
        elevation: 0,

        title: Text(
          item.title,

          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(24),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(
                width: double.infinity,

                child: Text(
                  item.arab,

                  textAlign: TextAlign.center,

                  style: GoogleFonts.amiri(fontSize: 34, height: 2),
                ),
              ),

              SizedBox(height: 10),

              Text(
                item.latin,

                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),

              SizedBox(height: 24),

              Text(
                item.arti,

                textAlign: TextAlign.center,

                style: GoogleFonts.inter(fontSize: 17, height: 1.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
