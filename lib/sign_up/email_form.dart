import 'package:flutter/material.dart';

class EmailForm extends StatelessWidget {
  final String signUpInfo, signUpHint;
  final String? isValid;
  // final Function finished;
  final TextEditingController signUpController;
  const EmailForm({
    super.key,
    required this.signUpInfo,
    required this.signUpHint,
    required this.signUpController,
    this.isValid,
    // required this.finished,
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
          keyboardType: TextInputType.emailAddress,
          // onEditingComplete: finished(),
          decoration: InputDecoration(
            hintText: signUpHint,
            hintStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
            errorText: isValid,
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
