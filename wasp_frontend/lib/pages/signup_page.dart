import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasp_frontend/resources/app_resources.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordVisible = false;
  bool _isPasswordConfirmVisible = false;

  String? _selectedoccupation;
  DateTime? _selectedDateOfBirth;
  bool _agreeToTerms = false;
  bool _receiveOffers = false;

  final List<String> _occupations = [
    'Student',
    'Academician',
    'Technician',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.pageBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryTextColor),
              ),
              const SizedBox(height: 20.0),

              // Name Input Field
              _buildInputField(
                icon: Icons.person_outline,
                hintText: "Name",
              ),
              const SizedBox(height: 20.0),

              // Surname Input Field
              _buildInputField(
                icon: Icons.person_outline,
                hintText: "Surname",
              ),
              const SizedBox(height: 20.0),

              // Email Input Field
              _buildInputField(
                icon: Icons.email_outlined,
                hintText: "Email",
              ),
              const SizedBox(height: 20.0),

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
              const SizedBox(height: 20.0),

              // occupation Input Field (Dropdown)
              _buildDropdownField(
                hintText: "Occupation",
                selectedValue: _selectedoccupation,
                options: _occupations,
                onChanged: (value) {
                  setState(() {
                    _selectedoccupation = value;
                  });
                },
              ),
              const SizedBox(height: 20.0),

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
              const SizedBox(height: 20.0),

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
              const SizedBox(height: 20.0),

              // Terms and Conditions
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.primary,
                    checkColor: AppColors.blackButtonBackground,
                    side: const BorderSide(
                        width: 2, color: AppColors.secondaryTextColor),
                    shape: const CircleBorder(),
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value!;
                      });
                    },
                  ),
                  const Expanded(
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
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.primary,
                    checkColor: AppColors.blackButtonBackground,
                    side: const BorderSide(
                        width: 2, color: AppColors.secondaryTextColor),
                    shape: const CircleBorder(),
                    value: _receiveOffers,
                    onChanged: (value) {
                      setState(() {
                        _receiveOffers = value!;
                      });
                    },
                  ),
                  const Expanded(
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
              const SizedBox(height: 20.0),

              // Register Button
              SizedBox(
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
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: AppColors.blackButtonTextColor,
                      fontFamily: 'Lexend',
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20.0),
              const Center(
                child: Text(
                  'I already have an account',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryTextColor),
                ),
              ),
            ],
          ),
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
          hintStyle: const TextStyle(
            color: AppColors.primaryTextColor,
            fontFamily: 'Lexend',
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(10.0),
        ),
        style: const TextStyle(
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
        obscureText: !isPasswordVisible,
        decoration: InputDecoration(
          prefixIcon:
              const Icon(Icons.lock_outline, color: AppColors.primaryTextColor),
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
          hintStyle: const TextStyle(
            color: AppColors.primaryTextColor,
            fontFamily: 'Lexend',
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(10.0),
        ),
        style: const TextStyle(
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
      width: double.infinity,
      height: AppDimens.inputTextFieldHeight,
      decoration: BoxDecoration(
        color: AppColors.pageBackground,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(color: AppColors.primaryTextColor, width: 2),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.work_outline,
              color: AppColors.primaryTextColor,
            ),
          ),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded:
                    true, // DropdownButton genişliği Container'a uyacak şekilde ayarlanır
                value: selectedValue,
                hint: Text(
                  hintText,
                  style: const TextStyle(
                    color: AppColors.primaryTextColor,
                    fontFamily: 'Lexend',
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.primaryTextColor,
                ),
                onChanged: onChanged,
                items: options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: const TextStyle(
                        color: AppColors.primaryTextColor,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
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
              const Icon(
                Icons.calendar_today,
                color: AppColors.primaryTextColor,
              ),
              const SizedBox(width: 10.0),
              Text(
                selectedDate == null
                    ? hintText
                    : DateFormat('dd/MM/yyyy').format(selectedDate),
                style: const TextStyle(
                  color: AppColors.primaryTextColor,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
