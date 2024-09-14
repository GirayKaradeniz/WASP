import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasp_frontend/pages/homePage.dart';
import 'package:wasp_frontend/pages/analyze_document.dart';
import 'package:wasp_frontend/pages/create_video.dart';
import 'package:wasp_frontend/resources/app_assets.dart';
import 'package:wasp_frontend/resources/app_colors.dart';
import 'package:wasp_frontend/pages/search.dart';

class BottomNavigationPage extends StatefulWidget {
  final Function(int index) onTap;
  const BottomNavigationPage({super.key, required this.onTap});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int myCurrentIndex = 0;

  List pages = [Homepage(), SearchPage(), CreateVideo(), AnalyzeDocument()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 105,
        color: AppColors.pageBackground,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BottomNavigationBar(
              backgroundColor: AppColors.navBarBackground,
              currentIndex: myCurrentIndex,
              showUnselectedLabels: false,
              onTap: (index) {
                setState(() {
                  myCurrentIndex = index;
                  widget.onTap(index);
                });
              },
              items: [
                BottomNavigationBarItem(
                    backgroundColor: AppColors.navBarBackground,
                    icon: SizedBox(
                      width: 30,
                      child: SvgPicture.asset(AppAssets.homeIcon, height: 35),
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 30,
                      child: SvgPicture.asset(AppAssets.searchIcon, height: 35),
                    ),
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 30,
                      child:
                          SvgPicture.asset(AppAssets.libraryIcon, height: 35),
                    ),
                    label: "Library"),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 30,
                      child:
                          SvgPicture.asset(AppAssets.profileIcon, height: 35),
                    ),
                    label: "Profile"),
              ]),
        ),
      ),
      body: pages[myCurrentIndex], // BottomNavigationPage ile bağlı sayfalar
    );
  }
}
