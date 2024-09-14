import 'package:flutter/material.dart';
import 'package:wasp_frontend/resources/app_resources.dart';
import 'package:wasp_frontend/widgets/loading.dart';

class CreateVideo extends StatefulWidget {
  @override
  _CreateVideoState createState() => _CreateVideoState();
}

class _CreateVideoState extends State<CreateVideo> {
  OverlayEntry? _overlayEntry;

  void _showLoading() {
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: LoadingWidget(),
      ),
    );

    overlay?.insert(_overlayEntry!);

    Future.delayed(Duration(seconds: 20), () {
      _overlayEntry?.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        backgroundColor: AppColors.pageBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryTextColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Create Video',
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Prompt:',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryTextColor,
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                maxLength: 200,
                maxLines: 6,
                style: TextStyle(
                  fontFamily: 'Lexend',
                  color: AppColors.primaryTextColor,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  counterText: '',
                  hintText: 'Enter your prompt...',
                  hintStyle: TextStyle(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '(max. 200 character)',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              width: double.infinity,
              height: AppDimens.signInButtonHeight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  _showLoading();
                },
                child: Text(
                  'Create Video',
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 16,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
