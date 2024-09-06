import 'package:flutter/material.dart';
import '../resources/app_resources.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.0),
            // Email Input Field
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined,
                    color: AppColors.primaryTextColor),
                hintText: "Email",
                hintStyle: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontFamily: 'Lexend',
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: AppColors.primaryTextColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: AppColors.primaryTextColor),
                ),
              ),
              style: TextStyle(
                color: AppColors.primaryTextColor,
                fontFamily: 'Lexend',
              ),
            ),
            SizedBox(height: 20.0),
            // Password Input Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.lock_outline, color: AppColors.primaryTextColor),
                suffixIcon: Icon(Icons.remove_red_eye_outlined,
                    color: AppColors.primaryTextColor),
                hintText: "Password",
                hintStyle: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontFamily: 'Lexend',
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: AppColors.primaryTextColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: AppColors.primaryTextColor),
                ),
              ),
              style: TextStyle(
                color: AppColors.primaryTextColor,
                fontFamily: 'Lexend',
              ),
            ),
            SizedBox(height: 20.0),
            // Sign In Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blackButtonBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              onPressed: () {
                // Add sign in functionality here
              },
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: AppColors.blackButtonTextColor,
                  fontFamily: 'Lexend',
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Forgot Password
            TextButton(
              onPressed: () {
                // Add forgot password functionality here
              },
              child: Text(
                "Forgot Password",
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontFamily: 'Lexend',
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Create an Account Button
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                side: BorderSide(color: AppColors.primaryTextColor),
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              onPressed: () {
                // Add create account functionality here
              },
              child: Text(
                "Create an account",
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontFamily: 'Lexend',
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
