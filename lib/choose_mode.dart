import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 42),
                child: Image.asset(
                  'assets/logo_gamify.png',
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Column(
                    children: [
                      SizedBox(height: 90),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Choose a ',
                            style: GoogleFonts.montserrat(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GradientText(
                            'Mode',
                            style: GoogleFonts.montserrat(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                            ),
                            colors: [
                              Color.fromRGBO(255, 33, 113, 20),
                              Color.fromRGBO(101, 40, 247, 20),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                          height:
                              80), // Add spacing between the texts and boxes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 128,
                                height: 128,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(165, 151, 23, 255),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Image.asset(
                                  'assets/children mode.png', // Path to your image asset
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                  height:
                                      8), // Add spacing between the image and text
                              Text(
                                'Children',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              width: 30), // Add spacing between the rectangles
                          Column(
                            children: [
                              Container(
                                width: 128,
                                height: 128,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(170, 255, 33, 114),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Image.asset(
                                  'assets/grown up mode.png', // Path to your image asset
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                  height:
                                      8), // Add spacing between the image and text
                              Text(
                                'Grown Ups',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
