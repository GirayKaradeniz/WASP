import 'package:flutter/material.dart';
import '../resources/app_resources.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordVisible = false; // track password visibility
  bool _isPasswordConfirmVisible = false; // track password confirm visibility

  String? _selectedOccasion; // Nullable to handle default empty state
  DateTime? _selectedDateOfBirth; // Selected date of birth
  bool _agreeToTerms = false; // Terms and conditions agreement
  bool _receiveOffers = false; // Consent to receive offers

  final List<String> _occasions = [
    'Birthday',
    'Anniversary',
    'Graduation',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryTextColor),
            ),
            SizedBox(height: 20.0),

            // Name Input Field
            _buildInputField(
              icon: Icons.person_outline,
              hintText: "Name",
            ),
            SizedBox(height: 20.0),

            // Surname Input Field
            _buildInputField(
              icon: Icons.person_outline,
              hintText: "Surname",
            ),
            SizedBox(height: 20.0),

            // Email Input Field
            _buildInputField(
              icon: Icons.email_outlined,
              hintText: "Email",
            ),
            SizedBox(height: 20.0),

            // Date of Birth Input Field (Date Picker)
            _buildDatePickerField(
              hintText: "Date of Birth",
              selectedDate: _selectedDateOfBirth,
              onDateSelected: (date) {
                setState(() {
                  _selectedDateOfBirth = date;
                });
              },
            ),
            SizedBox(height: 20.0),

            // Occasion Input Field (Dropdown)
            _buildDropdownField(
              hintText: "Occasion",
              selectedValue: _selectedOccasion,
              options: _occasions,
              onChanged: (value) {
                setState(() {
                  _selectedOccasion = value;
                });
              },
            ),
            SizedBox(height: 20.0),

            // Password Input Field
            _buildPasswordInputField(
              hintText: "Password",
              isPasswordVisible: _isPasswordVisible,
              toggleVisibility: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
            SizedBox(height: 20.0),

            // Password Confirm Input Field
            _buildPasswordInputField(
              hintText: "Confirm Password",
              isPasswordVisible: _isPasswordConfirmVisible,
              toggleVisibility: () {
                setState(() {
                  _isPasswordConfirmVisible = !_isPasswordConfirmVisible;
                });
              },
            ),
            SizedBox(height: 20.0),

            // Terms and Conditions
            Row(
              children: [
                Checkbox(
                  activeColor: AppColors.primary,
                  checkColor: AppColors.blackButtonBackground,
                  side:
                      BorderSide(width: 2, color: AppColors.secondaryTextColor),
                  shape: CircleBorder(),
                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    "I have read and agree to WASPs Terms of Service and Privacy Policy.",
                    style: TextStyle(
                      color: AppColors.secondaryTextColor,
                      fontFamily: 'Lexend',
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Checkbox(
                  activeColor: AppColors.primary,
                  checkColor: AppColors.blackButtonBackground,
                  side:
                      BorderSide(width: 2, color: AppColors.secondaryTextColor),
                  shape: CircleBorder(),
                  value: _receiveOffers,
                  onChanged: (value) {
                    setState(() {
                      _receiveOffers = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    "Yes, I would like to receive commercial electronic information and offers from WASP (including emails and push notifications, which may be subject to fees charged by my wireless carrier), including on my wireless device. You may later unsubscribe. Your consent is sought by WASP Software Technologies, Inc.",
                    style: TextStyle(
                      color: AppColors.secondaryTextColor,
                      fontFamily: 'Lexend',
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),

            // Register Button
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
                onPressed: () {
                  // register butonu eklenecek
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: AppColors.blackButtonTextColor,
                    fontFamily: 'Lexend',
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({required IconData icon, required String hintText}) {
    return Container(
      height: AppDimens.inputTextFieldHeight,
      decoration: BoxDecoration(
        color: AppColors.pageBackground,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(color: AppColors.primaryTextColor, width: 2),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: AppColors.primaryTextColor,
          ),
          hintText: hintText,
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
    );
  }

  Widget _buildPasswordInputField({
    required String hintText,
    required bool isPasswordVisible,
    required VoidCallback toggleVisibility,
  }) {
    return Container(
      height: AppDimens.inputTextFieldHeight,
      decoration: BoxDecoration(
        color: AppColors.pageBackground,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(color: AppColors.primaryTextColor, width: 2),
      ),
      child: TextField(
        obscureText: !isPasswordVisible, // password visibility toggle
        decoration: InputDecoration(
          prefixIcon:
              Icon(Icons.lock_outline, color: AppColors.primaryTextColor),
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: AppColors.primaryTextColor,
            ),
            onPressed: toggleVisibility,
          ),
          hintText: hintText,
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
    );
  }

  Widget _buildDropdownField({
    required String hintText,
    required String? selectedValue,
    required List<String> options,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      height: AppDimens.inputTextFieldHeight,
      decoration: BoxDecoration(
        color: AppColors.pageBackground,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(color: AppColors.primaryTextColor, width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text(
            hintText,
            style: TextStyle(
              color: AppColors.primaryTextColor,
              fontFamily: 'Lexend',
            ),
          ),
          icon: Icon(
            Icons.arrow_drop_down,
            color: AppColors.primaryTextColor,
          ),
          onChanged: onChanged,
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontFamily: 'Lexend',
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildDatePickerField({
    required String hintText,
    required DateTime? selectedDate,
    required ValueChanged<DateTime?> onDateSelected,
  }) {
    return Container(
      height: AppDimens.inputTextFieldHeight,
      decoration: BoxDecoration(
        color: AppColors.pageBackground,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(color: AppColors.primaryTextColor, width: 2),
      ),
      child: InkWell(
        onTap: () async {
          DateTime? date = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          onDateSelected(date);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: AppColors.primaryTextColor,
              ),
              SizedBox(width: 10.0),
              Text(
                selectedDate == null
                    ? hintText
                    : "${selectedDate.toLocal().toString().split(' ')[0]}",
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontFamily: 'Lexend',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
