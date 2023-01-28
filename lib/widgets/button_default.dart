import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String inputText;
  final String redirectPath;

  const MainButton({required this.inputText, required this.redirectPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, redirectPath);
        },
        child: Text(
          inputText,
          style: const TextStyle(fontSize: 30),
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff754A4A),
          onPrimary: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}
