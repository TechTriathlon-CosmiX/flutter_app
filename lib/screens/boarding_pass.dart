import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/card.dart';
import '../widgets/glass_card.dart';

class BoardingPassScreen extends StatefulWidget {
  const BoardingPassScreen({Key? key}) : super(key: key);

  @override
  _BoardingPassScreenState createState() => _BoardingPassScreenState();
}

class _BoardingPassScreenState extends State<BoardingPassScreen> {
  double rotationValue = 0.0;
  bool isFlipped = false; // Track the card's flipped state

  void _handleSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left) {
        rotationValue -= 0.0;
        isFlipped = !isFlipped; // Toggle the flipped state
      } else if (direction == SwipeDirection.right) {
        rotationValue += 0.0;
        isFlipped = !isFlipped; // Toggle the flipped state
      }
    });
  }

  // Define the content for both sides of the card
  Widget _buildFrontContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ... (front side content)
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Terminal",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CosmixColor.white,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Gate",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CosmixColor.white,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Group",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CosmixColor.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "2E",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFBC7E28),
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "K35",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFBC7E28),
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "B",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFBC7E28),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),

        Divider(
          color: Colors.grey.shade700,
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),

        //2nd Row
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Boarding \nTime",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CosmixColor.white,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Cabin",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CosmixColor.white,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Space \nShip",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CosmixColor.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "08:15",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFBC7E28),
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "12XE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFBC7E28),
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Stagwall",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFBC7E28),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ... (back side content)
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Luggage Deposits',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '00:17:54',
                        style: TextStyle(
                          color: Color(0xFFBC7E28),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text(
                        'Time to Gate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '38:22',
                        style: TextStyle(
                          color: Color(0xFFBC7E28),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/boarding_pass_card/qr_code.png',
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Boarding Pass")),
      backgroundColor: CosmixColor.bgColor,
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            _handleSwipe(SwipeDirection.right);
          } else if (details.primaryVelocity! < 0) {
            _handleSwipe(SwipeDirection.left);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: Tween<double>(begin: 0, end: rotationValue)
                      .animate(CurvedAnimation(
                    parent: ModalRoute.of(context)!.animation!,
                    curve: Curves.easeInOut,
                  )),
                  builder: (context, child) {
                    return Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.identity(),
                      child: child,
                    );
                  },
                  child: GlassCard(
                    type: CardType.light,
                    child:
                        isFlipped ? _buildBackContent() : _buildFrontContent(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum SwipeDirection {
  left,
  right,
}
