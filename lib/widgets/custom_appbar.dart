import 'package:el_kabah_app_backup/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 70,
      actionsPadding: EdgeInsets.only(right: 12),
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,

      title: Row(
        children: [
          Image.asset('assets/logo.png', width: 45),
          SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "EL-KA'BAH",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.greenMedium,
                ),
              ),

              Text(
                'APLIKASI KAUM MUSLIMIN',
                style: TextStyle(fontSize: 9, color: AppColors.greenMedium),
              ),
            ],
          ),
        ],
      ),

      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.info_outline, color: AppColors.greenMedium),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
