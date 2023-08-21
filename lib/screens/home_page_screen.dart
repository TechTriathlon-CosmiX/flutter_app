import 'package:CosmiX/controllers/trips_controller.dart';
import 'package:CosmiX/screens/swipable_planets.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/button.dart';
import 'package:CosmiX/widgets/card.dart';
import 'package:CosmiX/widgets/glass_button.dart';
import 'package:CosmiX/widgets/glass_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CosmixHome extends StatelessWidget {
  CosmixHome({super.key});
  final TripsController tripsController = Get.put(TripsController());

  @override
  Widget build(BuildContext context) {
    final List<Memory> memories = tripsController.memories;
    return Scaffold(
      backgroundColor: CosmixColor.bgColor,
      appBar: null,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: CosmixColor.darkGradient,
          // ),
          image: DecorationImage(
              image: AssetImage("assets/images/backgrounds/bg-4.webp"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 24.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 48, bottom: 4),
                  child: Text(
                    "Good morning John!",
                    style: TextStyle(fontSize: 20, color: CosmixColor.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 2, bottom: 28),
                  child: Text(
                    "You have 2 upcoming trips",
                    style: TextStyle(
                        fontSize: 15,
                        color: CosmixColor.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: GlassCard(
                    type: CardType.dark,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/homepage/welcome.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          // gradient fill
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  CosmixColor.black.withOpacity(0.8),
                                ],
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(), // Spacer
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 20.0),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'Introductory Offer',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: CosmixColor.white),
                                        ),
                                      ),
                                      GlassButton(
                                        type: ButtonType.primary,
                                        borderRadius: 8,
                                        width: 108,
                                        height: 32,
                                        onPressed: () {},
                                        fontSize: 13,
                                        buttonText: 'Check it out',
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Destinations",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: CosmixColor.white),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 0),
                    width: double.infinity,
                    height: 150,
                    child: SwipablePlanets()),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Sights you might like",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: CosmixColor.white),
                ),
                const SizedBox(
                  height: 32,
                ),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 24.0, // Horizontal spacing between items
                    mainAxisSpacing: 24.0, // Vertical spacing between items
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: memories.length,
                  // Adjust the number of cards as needed
                  itemBuilder: (context, index) {
                    return MemoryCard(memories[index].place,
                        memories[index].planet, index.toString());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MemoryCard extends StatelessWidget {
  String planet;
  String place;
  String imageno;
  MemoryCard(this.planet, this.place, this.imageno);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CustomCard(
            showBorder: false,
            showShadow: false,
            type: CardType.dark,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/trip_card_images/memory$imageno.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(children: [
                // gradient fill
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        CosmixColor.black.withOpacity(0.8),
                      ],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      place,
                      style: const TextStyle(
                          fontSize: 18, color: CosmixColor.white),
                    ),
                    Text(planet,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16,
                            color: CosmixColor.subTitleTextColor)),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
