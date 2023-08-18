import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'PriceButton.dart';

class CarouselWidget extends StatelessWidget {
  final List<String> carouselImages;
  final String propertyName;
  final String spaceTitle;
  final String spaceDescription;
  final double spaceRating;
  final int spacePrice;

  CarouselWidget({
    required this.carouselImages,
    required this.propertyName,
    required this.spaceTitle,
    required this.spaceDescription,
    required this.spaceRating,
    required this.spacePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(240, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(8, 158, 158, 158).withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselSlider(
            items: carouselImages
                .map(
                  (imageUrl) => Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 200,
              aspectRatio: 13 / 9,
              viewportFraction: 0.99,
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  propertyName,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'MontserratRegular',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        spaceTitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: 'MontserratMedium',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/Icon-16x-Star.svg',
                          color: Colors.orange,
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          spaceRating.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        spaceDescription,
                        style: TextStyle(
                            fontSize: 16, fontFamily: 'MontserratRegular'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomPriceButton(spacePrice: spacePrice)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
