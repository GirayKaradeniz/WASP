import 'package:flutter/material.dart';
import 'package:wasp_frontend/config/app_config.dart';
import 'package:wasp_frontend/resources/app_resources.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => MyHomePageState();
}

class MyHomePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: AppColors.pageBackground),
        width: screenSize.width,
        height: screenSize.height,
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
        child: Column(
          children: [
            // Welcome and User Name Container
            Container(
              width: screenSize.width,
              height: screenSize.height * 0.05,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 23),
                      children: [
                        TextSpan(
                          text: "Hello, ", // Static text
                          style: TextStyle(
                              color: Colors.black), // Style for the static text
                        ),
                        TextSpan(
                          text:
                              AppConfig.userName, // Dynamic text from AppConfig
                          style: TextStyle(
                            color: Colors
                                .black87, // Style for the dynamic text (e.g., blue color)
                            fontWeight: FontWeight
                                .bold, // You can add more styling as needed
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            //Create AI videos for a subject Container
            Container(
                margin: EdgeInsets.fromLTRB(0, screenSize.height * 0.04, 0, 0),
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.08,
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.play_arrow,
                      size: 50.0,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 25), // Add some spacing
                    Flexible(
                      child: Text(
                        'Create AI videos for a subject',
                        style: TextStyle(fontSize: 20),
                        maxLines:
                            2, // Set this to 2 or more if you want the text to wrap
                        overflow: TextOverflow
                            .ellipsis, // Adds ellipsis if the text overflows
                        softWrap:
                            false, // Prevents wrapping, if you prefer truncation
                      ),
                    ),
                  ],
                )),

            //Analyze Document Container
            Container(
                margin: EdgeInsets.fromLTRB(0, screenSize.height * 0.04, 0, 0),
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.08,
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.play_arrow,
                      size: 50.0,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 25), // Add some spacing
                    Flexible(
                      child: Text(
                        'Analyze Document',
                        style: TextStyle(fontSize: 20),
                        maxLines:
                            2, // Set this to 2 or more if you want the text to wrap
                        overflow: TextOverflow
                            .ellipsis, // Adds ellipsis if the text overflows
                        softWrap:
                            false, // Prevents wrapping, if you prefer truncation
                      ),
                    ),
                  ],
                )),

            // Last Contents
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(style: TextStyle(fontSize: 23), children: [
                      TextSpan(
                          text: "Last Contents",
                          style: TextStyle(
                              color: AppColors.primaryTextColor,
                              fontWeight: FontWeight.w700))
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
// This widget is the root of your application.
