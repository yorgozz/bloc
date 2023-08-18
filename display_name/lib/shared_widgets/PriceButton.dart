import 'package:flutter/material.dart';

class CustomPriceButton extends StatelessWidget {
  final int spacePrice;

  CustomPriceButton({required this.spacePrice});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 5),
          Text(
            'Starting Price',
            style: TextStyle(
                fontSize: 8,
                color: Colors.white,
                fontFamily: 'MontserratRegular'),
          ),
          SizedBox(height: 3),
          Row(
            children: [
              Row(
                children: [
                  Text(
                    '\$${spacePrice}',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'MontserratSemiBold'),
                  ),
                  Text(
                    '/night',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'MontserratMedium'),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
