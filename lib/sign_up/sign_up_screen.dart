import 'package:flutter/material.dart';
import 'package:flutter_carrot_market/log_in/log_in_screen.dart';
import 'package:flutter_carrot_market/sign_up/email_form.dart';
import 'package:flutter_carrot_market/sign_up/password_check_form.dart';
import 'package:flutter_carrot_market/sign_up/password_form.dart';
import 'package:flutter_carrot_market/sign_up/username_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCheckController = TextEditingController();

  String username = '';
  String email = '';
  String password = '';
  String passwordCheck = '';

  @override
  void initState() {
    super.initState();

    usernameController.addListener(() {
      setState(() {
        username = usernameController.text;
      });
    });
    emailController.addListener(() {
      setState(() {
        email = emailController.text;
      });
    });
    passwordController.addListener(() {
      setState(() {
        password = passwordController.text;
      });
    });
    passwordCheckController.addListener(() {
      setState(() {
        passwordCheck = passwordCheckController.text;
      });
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordCheckController.dispose();
    super.dispose();
  }

  String? isEmailValid() {
    if (email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(email)) {
      return '잘못된 이메일 형식입니다.';
    }
    return null;
  }

  String? isPasswordValid() {
    if (password.isEmpty) return null;
    final regExp = RegExp(
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$');
    if (!regExp.hasMatch(password)) {
      return '특수문자, 대소문자, 숫자 등 8~15자로 입력하세요.';
    }
    if (password != passwordCheck) {
      return '비밀번호가 일치하지 않습니다.';
    }
    return null;
  }

  String? isPasswordCheckValid() {
    if (passwordCheck.isEmpty) return null;
    final regExp = RegExp(
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$');
    if (!regExp.hasMatch(passwordCheck)) {
      return '특수문자, 대소문자, 숫자 등 8~15자로 입력하세요.';
    }
    if (password != passwordCheck) {
      return '비밀번호가 일치하지 않습니다.';
    }
    return null;
  }

  void onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  onSubmit() {
    if (email.isEmpty ||
        isEmailValid() != null ||
        password.isEmpty ||
        isPasswordValid() != null ||
        passwordCheck.isEmpty ||
        isPasswordCheckValid() != null) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onScaffoldTap,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            '회원가입',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              UsernameForm(
                signUpInfo: '별명',
                signUpHint: '별명을 만들어 주세요',
                signUpController: usernameController,
              ),
              EmailForm(
                signUpInfo: '이메일',
                signUpHint: '예: carrotmarket123@carrot.com',
                signUpController: emailController,
                // finished: onSubmit,
                isValid: isEmailValid(),
              ),
              PasswordForm(
                signUpInfo: '비밀번호',
                signUpHint: '비밀번호를 입력해주세요',
                signUpController: passwordController,
                // finished: onSubmit,
                isValid: isPasswordValid(),
              ),
              PasswordCheckForm(
                signUpInfo: '비밀번호확인',
                signUpHint: '비밀번호를 한번 더 입력해주세요',
                signUpController: passwordCheckController,
                // finished: onSubmit,
                isValid: isPasswordCheckValid(),
              ),
              GestureDetector(
                onTap: onSubmit,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: AnimatedContainer(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: username.isEmpty ||
                              email.isEmpty ||
                              password.isEmpty ||
                              passwordCheck.isEmpty
                          ? Colors.grey.shade300
                          : Colors.amber.shade900,
                    ),
                    duration: const Duration(milliseconds: 500),
                    child: const Text(
                      '가입하기',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
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
