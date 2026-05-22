import 'package:el_kabah_app_backup/pages/amalan_page.dart';
import 'package:el_kabah_app_backup/pages/home_page.dart';
import 'package:el_kabah_app_backup/pages/qiblah_page.dart';
import 'package:el_kabah_app_backup/pages/sholat_page.dart';
import 'package:el_kabah_app_backup/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  final List<Widget> pages = [

    HomePage(),
    SholatPage(),
    QiblahPage(),
    AmalanPage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavbar(

        currentIndex: currentIndex,

        onTap: (index) {

          setState(() {

            currentIndex = index;
          });
        },
      ),
    );
  }
}