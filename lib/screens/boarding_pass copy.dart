import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/card.dart';
import '../widgets/glass_card.dart';

class BoardingPassScreen extends StatelessWidget {
  const BoardingPassScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Boarding Pass")),
      backgroundColor: CosmixColor.bgColor,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlassCard(
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

                    Divider(  // Add a Divider widget here
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
            ],
          ),
        ),
      ),
    );
  }
}
