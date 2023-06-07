import 'package:flutter/material.dart';

class UsernameForm extends StatelessWidget {
  final String signUpInfo, signUpHint;
  final TextEditingController signUpController;
  const UsernameForm({
    super.key,
    required this.signUpInfo,
    required this.signUpHint,
    required this.signUpController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          signUpInfo,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        TextField(
          controller: signUpController,
          decoration: InputDecoration(
            hintText: signUpHint,
            hintStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
          ),
          cursorColor: Colors.amber.shade900,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
