import 'package:el_kabah_app_backup/theme/theme.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(color: Colors.white),

      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,

        iconSize: 22,
        selectedFontSize: 12,
        unselectedFontSize: 11,
        selectedItemColor: AppColors.greenDark,
        unselectedItemColor: Colors.grey.shade400,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_filled_rounded),
            label: "Sholat",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: "Qiblah",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: "Amalan",
          ),
        ],
      ),
    );
  }
}
