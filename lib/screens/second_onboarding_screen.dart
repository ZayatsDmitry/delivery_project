import 'package:delivery_app/widget/animating_circles.dart';
import 'package:flutter/material.dart';

class SecondOnBoardingScreen extends StatefulWidget {
  const SecondOnBoardingScreen({super.key});

  @override
  State<SecondOnBoardingScreen> createState() => _SecondOnBoardingScreenState();
}

class _SecondOnBoardingScreenState extends State<SecondOnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),

            Stack(
              alignment: Alignment.center,
              children: [
                const AnimatingCircles(),
                AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return Transform.translate(
                    offset: Offset(0, _controller.value * -50),
                    child: Image.asset(
                      "assets/character-2.png",
                      width: 200,
                      height: 200,
                    ),
                  );
                },
              ),]
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "It's not just the packages we deliver, but the care we put into every delivery.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                    itemCount: onBoardingTitle.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(
                          Icons.check_circle,
                          color: Colors.teal,
                        ),
                        title: Text(
                          onBoardingTitle[index],
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.teal,
              ),
              child: const Center(
                child: Text(
                  "Order Now",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> onBoardingTitle = [
  "Experiences Speedy Deliveries: From Your Door to Anywhere in Minutes.",
  "Shop, Order, Relax: Let Us Handle the Heavy Lifting.",
  "Track Your Deliveries in Real-Time: Know Exactly When to Expect Your Package.",
  "A World of Choices at Your Fingertips: Explore Restaurants, Stories, and More.",
  "Secure and Contactless: Your Safety, Our Priority.",
];
