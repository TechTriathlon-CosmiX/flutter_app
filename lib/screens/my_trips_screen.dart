import 'package:CosmiX/controllers/date_time_formatter.dart';
import 'package:CosmiX/controllers/trips_controller.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/card.dart';
import 'package:CosmiX/widgets/glass_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTrips extends StatelessWidget {
  MyTrips({super.key});
  final TripsController tripsController = Get.put(TripsController());
  final DateFormat dateformatcontroller = DateFormat();

  @override
  Widget build(BuildContext context) {
    final List<Trip> upcoming = tripsController.upcoming();
    final List<Trip> past = tripsController.past();
    final List<Memory> memories = tripsController.memories;

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
              ListView.builder(
                  itemCount: upcoming.length,
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TripCard(
                        upcoming[index].origin,
                        upcoming[index].destination,
                        dateformatcontroller
                            .dateFormatter(upcoming[index].date),
                        upcoming[index].spaceline,
                        upcoming[index].spaceship,
                        index.toString());
                  }),
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
              ListView.builder(
                  itemCount: past.length,
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TripCard(
                        past[index].origin,
                        past[index].destination,
                        dateformatcontroller.dateFormatter(past[index].date),
                        past[index].spaceline,
                        past[index].spaceship,
                        (upcoming.length - index).toString());
                  }),
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

class TripCard extends StatelessWidget {
  final String destination;
  final String origin;
  final String date;
  final String spaceline;
  final String spaceship;
  final String imageno;
  TripCard(this.destination, this.origin, this.date, this.spaceline,
      this.spaceship, this.imageno);

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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/trip_card_images/tripimage$imageno.png'),
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
                          Text(
                            origin,
                            style: TextStyle(
                                fontSize: 18, color: CosmixColor.white),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                            color: CosmixColor.white.withOpacity(0.75),
                          ),
                          Text(
                            destination,
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
                      Text(
                        date,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                spaceline,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: CosmixColor.subTitleTextColor),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                spaceline,
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
