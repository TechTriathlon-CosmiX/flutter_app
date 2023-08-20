import 'package:CosmiX/controllers/date_time_formatter.dart';
import 'package:CosmiX/controllers/trips_controller.dart';
import 'package:CosmiX/screens/swipable_planets.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/button.dart';
import 'package:CosmiX/widgets/card.dart';
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
      appBar: AppBar(title: const Text("Good Morning, Ramindu!")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
          child: Column(
            children: [
              GlassCard(
                child: Container(
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Introductory Offer',
                                    style: TextStyle(
                                        fontSize: 18, color: CosmixColor.white),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Check it out"))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/homepage/welcome.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                type: CardType.dark,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Destinations",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    color: CosmixColor.white),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: double.infinity,
                  height: 200,
                  child: SwipablePlanets()),
              Text(
                "Sights you might like",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    color: CosmixColor.white),
              ),
              const SizedBox(
                height: 24,
              ),
              GridView.builder(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
        margin: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
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
                      style: TextStyle(fontSize: 18, color: CosmixColor.white),
                    ),
                    Text(planet,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: CosmixColor.subTitleTextColor)),
                    SizedBox(
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
