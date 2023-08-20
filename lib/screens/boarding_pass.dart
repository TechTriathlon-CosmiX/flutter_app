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

  void _handleSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left) {
        rotationValue -= 180.0;
      } else if (direction == SwipeDirection.right) {
        rotationValue += 180.0;
      }
    });
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
                  animation: Tween<double>(begin: 0, end: rotationValue).animate(CurvedAnimation(
                    parent: ModalRoute.of(context)!.animation!,
                    curve: Curves.easeInOut,
                  )),
                  builder: (context, child) {
                    return Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(rotationValue * 3.141592653589793 / 180),
                      child: child,
                    );
                  },
                  child: GlassCard(
                    type: CardType.light,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //1st Row
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
                                  "Ship",
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
                    ),
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
