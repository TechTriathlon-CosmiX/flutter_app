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
      appBar: AppBar(title: Text("My Trips")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
          child: Column(
            children: [
              Container(
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
              SizedBox(
                height: 30,
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  TripCard(),
                  TripCard(),
                ],
              ),
              Container(
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
              SizedBox(
                height: 30,
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  TripCard(),
                  TripCard(),
                ],
              ),
              Container(
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
              SizedBox(
                height: 30,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: 4, // Adjust the number of cards as needed
                itemBuilder: (context, index) {
                  return MemoryCard();
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
        margin: EdgeInsets.all(10),
        child: GlassCard(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/images/trip_card_images/HomePage.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
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
                        fontSize: 16, color: CosmixColor.subTitleTextColor)),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          type: CardType.dark,
          height: 300,
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
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
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
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mars",
                            style: TextStyle(
                                fontSize: 18, color: CosmixColor.white),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                            color: CosmixColor.white.withOpacity(0.75),
                          ),
                          Text(
                            "Earth",
                            style: TextStyle(
                                fontSize: 18, color: CosmixColor.white),
                          ),
                          Icon(
                            Icons.share_outlined,
                            size: 18,
                            color: CosmixColor.white,
                          ),
                        ],
                      ),
                      Text(
                        "30th September 2163",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: CosmixColor.subTitleTextColor, fontSize: 14),
                      ),
                      Container(
                        width: 333.0,
                        height: 2.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CosmixColor.logoColor.withOpacity(0.2),
                              CosmixColor.logoColor,
                              CosmixColor.logoColor.withOpacity(0.2),
                            ],
                            stops: [0.0, 0.5, 1.0],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Spaceship Partner",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: CosmixColor.subTitleTextColor),
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
          type: CardType.dark,
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
