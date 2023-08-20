import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/card.dart';
import 'package:CosmiX/widgets/glass_card.dart';
import 'package:flutter/material.dart';

class MyTrips extends StatelessWidget {
  const MyTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CosmixColor.bgColor,
      appBar: AppBar(title: const Text("My Trips")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Upcoming",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: CosmixColor.white),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ListView(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  TripCard(),
                  TripCard(),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Past Trips",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: CosmixColor.white),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ListView(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  TripCard(),
                  TripCard(),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Memories made for you",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: CosmixColor.white),
                ),
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
                itemCount: 4,
                // Adjust the number of cards as needed
                itemBuilder: (context, index) {
                  return const MemoryCard();
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
  const MemoryCard({
    super.key,
  });

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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/trip_card_images/HomePage.png'),
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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "Place Name",
                      style: TextStyle(fontSize: 18, color: CosmixColor.white),
                    ),
                    Text("Planet Name",
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

class TripCard extends StatelessWidget {
  const TripCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlassCard(
          height: 220,
          type: CardType.dark,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/trip_card_images/HomePage.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Mars",
                            style: TextStyle(
                                fontSize: 18, color: CosmixColor.white),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                            color: CosmixColor.white.withOpacity(0.75),
                          ),
                          const Text(
                            "Earth",
                            style: TextStyle(
                                fontSize: 18, color: CosmixColor.white),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.share_outlined,
                              size: 18,
                              color: CosmixColor.white,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "30th September 2163",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: CosmixColor.subTitleTextColor, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Container(
                        width: double.infinity,
                        height: 2.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CosmixColor.primaryColor.withOpacity(0.2),
                              CosmixColor.primaryColor,
                              CosmixColor.primaryColor.withOpacity(0.2),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Spaceline",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: CosmixColor.subTitleTextColor),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "GalacticSkyways Express",
                                style: TextStyle(
                                    fontSize: 14, color: CosmixColor.white),
                              )
                            ],
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Spaceship",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: CosmixColor.subTitleTextColor),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "Odyssey",
                                  style: TextStyle(
                                      fontSize: 14, color: CosmixColor.white),
                                )
                              ])
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 24)
      ],
    );
  }
}
