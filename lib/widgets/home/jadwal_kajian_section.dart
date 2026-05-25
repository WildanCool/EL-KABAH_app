import 'package:el_kabah_app_backup/theme/theme.dart';
import 'package:flutter/material.dart';

class JadwalKajianSection extends StatelessWidget {
  const JadwalKajianSection({super.key});

  @override
  Widget build(BuildContext context) {
    final kajianList = [
      {
        "ustadz": "Ustadz Adi Hidayat",
        "tema": "Pentingnya Menjaga Sholat",
        "tanggal": "23 Mei",
        "lokasi": "Masjid Al-Hikmah",
      },

      {
        "ustadz": "Ustadz Firanda Andirja",
        "tema": "Belajar Tauhid",
        "tanggal": "25 Mei",
        "lokasi": "Masjid Raya",
      },

      {
        "ustadz": "Ustadz Syafiq Riza",
        "tema": "Keutamaan Ilmu",
        "tanggal": "28 Mei",
        "lokasi": "Masjid Al-Ikhlas",
      },
    ];

    return Container(
      width: double.infinity,
      color: AppColors.greenLight,
      padding: EdgeInsets.only(left: 18, top: 18, bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // TITLE
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Jadwal ",

                  style: TextStyle(color: AppColors.white, fontSize: 18),
                ),

                TextSpan(
                  text: "Kajian",

                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 14),

          SizedBox(
            height: 185,

            child: ListView.separated(
              scrollDirection: Axis.horizontal,

              itemCount: kajianList.length,

              separatorBuilder: (_, __) {
                return SizedBox(width: 14);
              },

              itemBuilder: (context, index) {
                final kajian = kajianList[index];

                return Container(
                  width: 280,

                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),

                        blurRadius: 18,

                        offset: Offset(0, 6),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      // DATE
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),

                        decoration: BoxDecoration(
                          color: Color(0xff80875F).withOpacity(0.12),

                          borderRadius: BorderRadius.circular(14),
                        ),

                        child: Text(
                          kajian["tanggal"]!,

                          style: TextStyle(
                            color: Color(0xff80875F),

                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Spacer(),

                      // USTADZ
                      Text(
                        kajian["ustadz"]!,

                        maxLines: 1,

                        overflow: TextOverflow.ellipsis,

                        style: TextStyle(
                          color: Colors.grey.shade600,

                          fontSize: 13,

                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: 6),

                      // TEMA
                      Text(
                        kajian["tema"]!,

                        maxLines: 2,

                        overflow: TextOverflow.ellipsis,

                        style: TextStyle(
                          color: Colors.black,

                          fontSize: 24,

                          fontWeight: FontWeight.bold,

                          height: 1,
                        ),
                      ),

                      SizedBox(height: 14),

                      // LOKASI
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,

                            color: Colors.grey.shade500,

                            size: 18,
                          ),

                          SizedBox(width: 4),

                          Expanded(
                            child: Text(
                              kajian["lokasi"]!,

                              maxLines: 1,

                              overflow: TextOverflow.ellipsis,

                              style: TextStyle(
                                color: Colors.grey.shade600,

                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
