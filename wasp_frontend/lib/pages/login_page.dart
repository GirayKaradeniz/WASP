import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasp_frontend/resources/app_resources.dart';
import 'package:wasp_frontend/pages/signup_page.dart';
import 'package:wasp_frontend/pages/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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

    if (email == 'test' && password == 'test') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.falseRed,
            content: Text(
              'Invalid mail or password',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w500),
            )),
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70.0),
              // App Name
              const Center(
                child: Text(
                  'WASP',
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 36.0),
              // Welcome Message
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Text(
                  '‘Ne zaman gelir?’ diyorduk... ve geldin.',
                  style: const TextStyle(
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 48.0),
              // Email/Phone/Username Input
              Container(
                height: AppDimens.inputTextFieldHeight,
                decoration: BoxDecoration(
                  color: AppColors.pageBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border:
                      Border.all(color: AppColors.primaryTextColor, width: 1.2),
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Telefon, email ya da kullanıcı adı',
                    hintStyle: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontFamily: 'Lexend',
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                  ),
                  style: const TextStyle(
                    color: AppColors.primaryTextColor,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              // Password Input
              Container(
                height: AppDimens.inputTextFieldHeight,
                decoration: BoxDecoration(
                  color: AppColors.pageBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border:
                      Border.all(color: AppColors.primaryTextColor, width: 1.2),
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Şifre',
                    hintStyle: const TextStyle(
                      color: AppColors.primaryTextColor,
                      fontFamily: 'Lexend',
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 0),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.primaryTextColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  style: const TextStyle(
                    color: AppColors.primaryTextColor,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
              const SizedBox(height: 18.0),
              // Forgot Password
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Şifremi unuttum',
                    style: TextStyle(
                      color: AppColors.thirdTextColor,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              // Giriş Yap Button (Gradient)
              GradientButton(
                text: 'Giriş Yap',
                onPressed: _signIn,
                height: AppDimens.signInButtonHeight,
                borderRadius: 50,
                gradientColors: const [Color(0xFFFFC800), Color(0xFFFF9100)],
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 32.0),
              // Sign Up Prompt
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Daha kayıt olmadın mı? ',
                      style: TextStyle(
                        color: AppColors.primaryTextColor,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: const Text(
                        'Hemen Kaydol',
                        style: TextStyle(
                          color: Color(0xFFFF9100),
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w700,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48.0),
              // Social Sign In Buttons
              SizedBox(
                width: double.infinity,
                height: AppDimens.signInButtonHeight,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    side: const BorderSide(
                        width: 1.5, color: AppColors.primaryTextColor),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Sign in with Google',
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              SizedBox(
                width: double.infinity,
                height: AppDimens.signInButtonHeight,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    side: const BorderSide(
                        width: 1.5, color: AppColors.primaryTextColor),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Sign in with Apple',
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double borderRadius;
  final List<Color> gradientColors;
  final TextStyle textStyle;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.borderRadius = 50,
    this.gradientColors = const [Color(0xFFFFC800), Color(0xFFFF9100)],
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Lexend',
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          onPressed: onPressed,
          child: Text(text, style: textStyle),
        ),
      ),
    );
  }
}
