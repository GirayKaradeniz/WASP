import 'package:flutter/material.dart';
import 'package:wasp_frontend/resources/app_resources.dart';
import 'package:wasp_frontend/widgets/loading.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class AnalyzeDocument extends StatefulWidget {
  @override
  _AnalyzeDocumentState createState() => _AnalyzeDocumentState();
}

class _AnalyzeDocumentState extends State<AnalyzeDocument> {
  OverlayEntry? _overlayEntry;

  void _showLoading() {
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: LoadingWidget(), // Bu widget'ın tanımlı olduğundan emin olun
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
          'Analyze Document',
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
          children: [
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                border: DashedBorder.fromBorderSide(
                  dashLength: 15,
                  side:
                      BorderSide(color: AppColors.secondaryTextColor, width: 2),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Daire ve metni ortalamak için
                children: [
                  Container(
                    width: 70.0, // Dairenin genişliği
                    height: 70.0, // Dairenin yüksekliği
                    decoration: BoxDecoration(
                      color: AppColors.primary, // Dairenin rengi
                      shape: BoxShape.circle, // Şekil daire
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add, // İkon
                        size: 40.0, // İkonun boyutu
                        color: AppColors.primaryTextColor, // İkonun rengi
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0), // Daire ve metin arasında boşluk
                  Text(
                    'Add File',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 16,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '(max. 200 MB)',
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
                  'Analyze Document',
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
