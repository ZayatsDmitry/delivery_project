import 'package:delivery_app/screens/second_onboarding_screen.dart';
import 'package:flutter/material.dart';

class FirstOnBoardingScreen extends StatefulWidget {
  const FirstOnBoardingScreen({super.key});

  @override
  State<FirstOnBoardingScreen> createState() => _FirstOnBoardingScreenState();
}

class _FirstOnBoardingScreenState extends State<FirstOnBoardingScreen> {
  Offset imageOffset = Offset.zero;
  String titleText = "Deliver";
  double buttonOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width - 80;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: Text(
              titleText,
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const Center(
            child: Text(
              "Deliver & Delight: Your World, Your Order, Your Way",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          Transform(
            transform: Matrix4.translationValues(
              imageOffset.dx,
              0,
              0,
            )..rotateZ((imageOffset.dx / 20) * 3.14 / 90),
            child: GestureDetector(
              onPanUpdate: (details) {
                if (imageOffset.dx.abs() <= 120) {
                  setState(() {
                    imageOffset = Offset(imageOffset.dx + details.delta.dx, 0);
                    titleText = "Order";
                  });
                }
              },
              onPanEnd: (_) {
                setState(() {
                  imageOffset = Offset.zero;
                  titleText = "Deliver";
                });
              },
              child: SizedBox(
                height: 350,
                width: 350,
                child: Image.asset("assets/character-1.png"),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dx > 0 && buttonOffset <= buttonWidth - 80) {
                setState(() {
                  buttonOffset += details.delta.dx;
                });
              }
            },
            onPanEnd: (_) {
              if (buttonOffset > buttonWidth / 2) {
                setState(() {
                  buttonOffset = buttonWidth - 80;
                });
                print("Working");
                // todo
                // go to second screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondOnBoardingScreen(),
                  ),
                );
              } else {
                setState(() {
                  buttonOffset = 0.0;
                });
              }
            },
            child: Container(
              width: buttonWidth,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Stack(
                children: [
                  AnimatedContainer(
                    width: buttonOffset + 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.red.shade200,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    duration: const Duration(milliseconds: 200),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 80,
                        height: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.chevron_right,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Get started",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
