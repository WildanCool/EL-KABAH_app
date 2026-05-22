import 'package:el_kabah_app_backup/models/surat_model.dart';

import 'package:flutter/material.dart';

class SuratTile extends StatelessWidget {
  final SuratModel surat;

  final VoidCallback onTap;

  const SuratTile({super.key, required this.surat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(20),

      child: Container(
        margin: const EdgeInsets.only(bottom: 14),

        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),

          borderRadius: BorderRadius.circular(20),

          border: Border.all(color: Colors.white10),
        ),

        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,

              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.15),

                shape: BoxShape.circle,
              ),

              child: Center(
                child: Text(
                  surat.nomor.toString(),

                  style: const TextStyle(
                    color: Colors.greenAccent,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    surat.namaLatin,

                    style: const TextStyle(
                      color: Colors.white,

                      fontSize: 18,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "${surat.arti} • ${surat.jumlahAyat} Ayat",

                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),

                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            Text(
              surat.nama,

              style: const TextStyle(
                color: Colors.white,

                fontSize: 24,

                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
