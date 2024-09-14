import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wasp_frontend/resources/app_resources.dart';

class LoadingWidget extends StatefulWidget {
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  final List<String> messages = [
    'Please wait...',
    'Creating...',
    'Almost there...',
    'Just a moment...',
  ];

  int currentMessageIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), _updateMessage);
  }

  void _updateMessage() {
    setState(() {
      currentMessageIndex = (currentMessageIndex + 1) % messages.length;
    });
    Future.delayed(Duration(seconds: 22), _updateMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.hexagonDots(
                color: AppColors.primary,
                size: 50,
              ),
              SizedBox(height: 20),
              Text(
                messages[currentMessageIndex],
                style: TextStyle(
                  fontFamily: 'Lexend',
                  color: AppColors.primaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
