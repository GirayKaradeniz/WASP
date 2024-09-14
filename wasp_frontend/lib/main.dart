import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasp_frontend/pages/login_page.dart';
import 'package:wasp_frontend/pages/create_video.dart';
import 'package:wasp_frontend/pages/splash_screen.dart';
import 'package:wasp_frontend/resources/app_navbar.dart';
import 'package:wasp_frontend/resources/app_resources.dart';
import 'package:wasp_frontend/config/app_config.dart';
import 'pages/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WASP',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.blackButtonBackground,
        hoverColor: AppColors.pageBackground,
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myCurrentIndex = 0;
  List pages = const [Homepage()];

  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
