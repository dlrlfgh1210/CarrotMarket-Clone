import 'package:flutter/material.dart';
import 'package:flutter_carrot_market/location/location_screen.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLogin extends StatefulWidget {
  const KakaoLogin({super.key});

  @override
  State<KakaoLogin> createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<KakaoLogin> {
  void getUserInfo() async {
    try {
      User user = await UserApi.instance.me();
      print('사용자 정보 요청 성공'
          '\n회원번호: ${user.id}'
          '\n닉네임: ${user.kakaoAccount?.profile?.nickname}');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LocationScreen(),
        ),
      );
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
        'lib/asset/kakao.png',
        width: 100,
        height: 100,
      ),
      onTap: () async {
        if (await isKakaoTalkInstalled()) {
          try {
            await UserApi.instance.loginWithKakaoTalk();

            getUserInfo();
          } catch (error) {
            try {
              await UserApi.instance.loginWithKakaoAccount();

              getUserInfo();
            } catch (error) {}
          }
        } else {
          try {
            await UserApi.instance.loginWithKakaoAccount();

            getUserInfo();
          } catch (error) {}
        }
      },
    );
  }
}
