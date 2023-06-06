import 'package:flutter/material.dart';
import 'package:flutter_carrot_market/log_in/log_in_screen.dart';
import 'package:flutter_carrot_market/sign_up/my_container.dart';
import 'package:flutter_carrot_market/sign_up/username_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void onLogInTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      ),
    );
  }

  void onSignUpTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'lib/asset/logo.jpg',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '당신 근처의 당근마켓',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '내 동네를 설정하고 \n 당근마켓을 시작해보세요.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 200,
                ),
                GestureDetector(
                  onTap: () => onSignUpTap(context),
                  child: MyContainer(
                    todo: '시작하기',
                    login: '',
                    bgColor: Colors.amber.shade900,
                    textColor: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () => onLogInTap(context),
                  child: MyContainer(
                    todo: '이미 계정이 있나요?',
                    login: '로그인',
                    bgColor: Colors.white,
                    textColor: Colors.grey,
                    loginTextColor: Colors.amber.shade900,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
