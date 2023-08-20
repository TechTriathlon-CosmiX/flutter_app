import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/button.dart';
import 'package:CosmiX/widgets/card.dart';
import 'package:CosmiX/widgets/glass_card.dart';
import 'package:flutter/material.dart';

class SpaceLines extends StatelessWidget {
  const SpaceLines({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CosmixColor.bgColor,
      appBar: AppBar(title: Text("Space Lines")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SpacelineCard(),
                  SpacelineCard(),
                  SpacelineCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpacelineCard extends StatelessWidget {
  const SpacelineCard({
    super.key,
  });

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
                    Column(
                      children: [
                        Text(
                          'Monday Aug 2235',
                          style:
                              TextStyle(fontSize: 10, color: CosmixColor.white),
                        ),
                        Text(
                          '07:15',
                          style:
                              TextStyle(fontSize: 24, color: CosmixColor.white),
                        ),
                        Text(
                          'Sri Lanka',
                          style:
                              TextStyle(fontSize: 16, color: CosmixColor.white),
                        )
                      ],
                    ),
                    Image.asset('assets/images/spaceships/spaceship1.png'),
                    Container(
                      width: 80,
                      child: Text("Galactic Skyways",
                          textAlign: TextAlign.right,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 16, color: CosmixColor.white)),
                    )
                  ],
                ),
                Text(
                  "2 months",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: CosmixColor.white),
                ),
                Button(
                  onPressed: () {},
                  buttonText: "From 4 million onwards",
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
