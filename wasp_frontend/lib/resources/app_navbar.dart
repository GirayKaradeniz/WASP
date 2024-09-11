import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasp_frontend/pages/homePage.dart';
import 'package:wasp_frontend/pages/login_page.dart';
import 'package:wasp_frontend/pages/signup_page.dart';
import 'package:wasp_frontend/resources/app_assets.dart';
import 'package:wasp_frontend/resources/app_colors.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int myCurrentIndex = 0;

  List pages = [Homepage(), LoginPage(), RegisterPage()];
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
              backgroundColor: Colors.black,
              currentIndex: myCurrentIndex,
              showUnselectedLabels: false,
              onTap: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Colors.black,
                    icon: SizedBox(
                      // Wrapping icon in SizedBox to reduce item size
                      width: 30, // Reduced width for the item
                      child: SvgPicture.asset(AppAssets.homeIcon,
                          height: 35), // Smaller icon size
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      // Wrapping icon in SizedBox to reduce item size
                      width: 30, // Reduced width for the item
                      child: SvgPicture.asset(AppAssets.searchIcon,
                          height: 35), // Smaller icon size
                    ),
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      // Wrapping icon in SizedBox to reduce item size
                      width: 30, // Reduced width for the item
                      child: SvgPicture.asset(AppAssets.libraryIcon,
                          height: 35), // Smaller icon size
                    ),
                    label: "Library"),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      // Wrapping icon in SizedBox to reduce item size
                      width: 30, // Reduced width for the item
                      child: SvgPicture.asset(AppAssets.profileIcon,
                          height: 35), // Smaller icon size
                    ),
                    label: "Profile"),
              ]),
        ),
      ),
      body: pages[myCurrentIndex],
    );
  }
}
