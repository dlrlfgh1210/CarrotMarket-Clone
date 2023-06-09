import 'package:flutter/material.dart';
import 'package:flutter_carrot_market/home/home_screen.dart';
import 'package:flutter_carrot_market/log_in/kakao_login.dart';
import 'package:flutter_carrot_market/log_in/log_in_form.dart';
import 'package:flutter_carrot_market/sign_up/change_color_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  bool obscureText = true;

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    }
  }

  void onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void toggleObscureText() {
    obscureText = !obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('로그인'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 36,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                LogInForm(
                  logInHint: '이메일',
                  eyePass: null,
                  secret: false,
                  saveValue: (newValue) {
                    if (newValue != null) {
                      formData['email'] = newValue;
                    }
                  },
                  logInKeyBoard: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16,
                ),
                LogInForm(
                  logInHint: '비밀번호',
                  eyePass: GestureDetector(
                    onTap: toggleObscureText,
                    child: obscureText
                        ? const Icon(Icons.open_in_new)
                        : const Icon(Icons.open_in_new_off),
                  ),
                  secret: obscureText,
                  saveValue: (newValue) {
                    if (newValue != null) {
                      formData['password'] = newValue;
                    }
                  },
                  logInKeyBoard: TextInputType.text,
                ),
                const SizedBox(
                  height: 28,
                ),
                GestureDetector(
                  onTap: _onSubmitTap,
                  child: const ChangeColorButton(
                    disabled: false,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                const KakaoLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
