import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorSnackbar {
  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(8),
            color: Color.fromARGB(255, 236, 211, 214),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/Group 11801.svg',
                width: 24,
                height: 24,
              ),
              SizedBox(width: 18),
              Flexible(
                child: Text(
                  message,
                  style: TextStyle(color: Color(0xFFAE2D3C)),
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        margin: EdgeInsets.only(bottom: 650, left: 16, right: 16),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
