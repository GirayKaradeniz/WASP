import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasp_frontend/resources/app_resources.dart';
import 'package:wasp_frontend/pages/signup_page.dart';
import 'package:wasp_frontend/pages/homepage.dart';

import '../resources/app_navbar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == 'Admin1234' && password == '1234admin') {
      // Giriş başarılı, anasayfaya yönlendirilir
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => BottomNavigationPage(onTap: (index) {})),
      );
    } else {
      // Hata mesajı gösterilir
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Geçersiz kullanıcı adı veya şifre')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.pageBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70.0),

              Container(
                width: 150,
                height: 150,
                child:
                    SvgPicture.asset(AppAssets.waspLogoIconYellowBlackStroke),
              ),

              SizedBox(height: 70.0),

              // Email Input Field
              Container(
                height: AppDimens.inputTextFieldHeight,
                decoration: BoxDecoration(
                  color: AppColors.pageBackground,
                  borderRadius: BorderRadius.circular(50.0),
                  border:
                      Border.all(color: AppColors.primaryTextColor, width: 2),
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.primaryTextColor,
                    ),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontFamily: 'Lexend',
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                  style: TextStyle(
                    color: AppColors.primaryTextColor,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              // Password Input Field
              Container(
                height: AppDimens.inputTextFieldHeight,
                decoration: BoxDecoration(
                  color: AppColors.pageBackground,
                  borderRadius: BorderRadius.circular(50.0),
                  border:
                      Border.all(color: AppColors.primaryTextColor, width: 2),
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText:
                      !_isPasswordVisible, // password visibility toggle
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline,
                        color: AppColors.primaryTextColor),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.primaryTextColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible =
                              !_isPasswordVisible; // toggle visibility
                        });
                      },
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontFamily: 'Lexend',
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                  style: TextStyle(
                    color: AppColors.primaryTextColor,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              // Sign In Button
              Container(
                width: double.infinity,
                height: AppDimens.signInButtonHeight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blackButtonBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  onPressed: _signIn,
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: AppColors.blackButtonTextColor,
                      fontFamily: 'Lexend',
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10.0),

              // Forgot Password
              TextButton(
                onPressed: () {
                  // şifremi unuttum actionu eklenecek
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: AppColors.primaryTextColor,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ),

              SizedBox(height: 90.0),

              // Create an Account Button
              Container(
                width: double.infinity,
                height: AppDimens.signInButtonHeight,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    side:
                        BorderSide(width: 2, color: AppColors.primaryTextColor),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
