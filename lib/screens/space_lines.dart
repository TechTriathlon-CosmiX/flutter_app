import 'package:CosmiX/controllers/date_time_formatter.dart';
import 'package:CosmiX/controllers/space_lines_controller.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/button.dart';
import 'package:CosmiX/widgets/card.dart';
import 'package:CosmiX/widgets/glass_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpaceLines extends StatelessWidget {
  SpaceLines({super.key});
  final SpaceLinesController spaceLinesController =
      Get.put(SpaceLinesController());
  final DateFormat dateformatcontroller = DateFormat();

  @override
  Widget build(BuildContext context) {
    final List<SpaceLine> spacelines = spaceLinesController.spaceLines;
    return Scaffold(
      backgroundColor: CosmixColor.bgColor,
      appBar: AppBar(title: Text("Space Lines")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
          child: Column(
            children: [
              ListView.builder(
                  itemCount: spacelines.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SpacelineCard(
                        dateformatcontroller
                            .dateFormatter(spacelines[index].date),
                        dateformatcontroller
                            .timeFormatter(spacelines[index].time),
                        spacelines[index].country,
                        spacelines[index].spaceline,
                        spacelines[index].cost,
                        spacelines[index].duration);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class SpacelineCard extends StatelessWidget {
  final String date;
  final String time;
  final String country;
  final String spaceline;
  final String cost;
  final String duration;
  SpacelineCard(this.date, this.time, this.country, this.spaceline, this.cost,
      this.duration);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlassCard(
          height: 220,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            date,
                            style: TextStyle(
                                fontSize: 10, color: CosmixColor.white),
                          ),
                          Text(
                            time,
                            style: TextStyle(
                                fontSize: 24, color: CosmixColor.white),
                          ),
                          Text(
                            country,
                            style: TextStyle(
                                fontSize: 14, color: CosmixColor.white),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Image.asset(
                            'assets/images/spaceships/spaceship1.png')),
                    Expanded(
                      child: Text(spaceline,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 16, color: CosmixColor.white)),
                    )
                  ],
                ),
                Text(
                  '$duration months',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: CosmixColor.white),
                ),
                Button(
                  onPressed: () {},
                  buttonText: "From $cost million onwards",
                  type: ButtonType.secondary,
                  rightIcon: Icon(Icons.arrow_forward_ios_rounded),
                )
              ],
            ),
          ),
          type: CardType.dark,
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
