import 'package:el_kabah_app_backup/datas/motivation_data.dart';
import 'package:el_kabah_app_backup/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MotivationSliderSection extends StatefulWidget {
  const MotivationSliderSection({super.key});

  @override
  State<MotivationSliderSection> createState() =>
      _MotivationSliderSectionState();
}

class _MotivationSliderSectionState extends State<MotivationSliderSection> {
  final PageController pageController = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      padding: EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // TITLE
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Daily ",

                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),

                TextSpan(
                  text: "Reminder",

                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 14),

          // SLIDER
          SizedBox(
            height: 260,

            child: PageView.builder(
              controller: pageController,

              itemCount: motivationList.length,

              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },

              itemBuilder: (context, index) {
                final item = motivationList[index];

                return Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(36),
                    image: DecorationImage(
                      image: AssetImage("assets/motif.png"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white.withOpacity(0.2),
                  ),

                  child: Container(
                    padding: EdgeInsets.all(46),

                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(36),
                    ),

                    child: Center(
                      child: Text(
                        item["text"]!,

                        textAlign: TextAlign.center,

                        style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 22),

          // INDICATOR
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: List.generate(motivationList.length, (index) {
              final isActive = currentIndex == index;

              return AnimatedContainer(
                duration: Duration(milliseconds: 250),

                margin: EdgeInsets.symmetric(horizontal: 4),

                width: isActive ? 28 : 8,

                height: 8,

                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.greenMedium
                      : Colors.grey.shade400,

                  borderRadius: BorderRadius.circular(100),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
