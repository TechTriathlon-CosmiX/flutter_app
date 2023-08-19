import 'dart:math';

import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/theme/fonts.dart';
import 'package:CosmiX/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';

enum FromToCardType { from, to }

class FromToCustomCard extends StatelessWidget {
  final String location;
  final String description;
  final CardType type;
  final FromToCardType fromtotype;
  final VoidCallback onTap;

  const FromToCustomCard({
    Key? key,
    required this.type,
    required this.fromtotype,
    required this.onTap,
    required this.location,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      onTap: (){
        print(fromtotype);
        print(FromToCardType.from);
        print(fromtotype == FromToCardType.from);
        String val = fromtotype == FromToCardType.from ? 'FROM' : 'TO';
        print(val);
      },
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: CosmixColor.lightWhite,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: CustomCard(
          type: type,
          child: FromToChild(fromtotype: fromtotype, location: location,description: description,),
        ),
      ),
    );
  }
}

class FromToChild extends StatelessWidget {
  final FromToCardType fromtotype;
  final String location;
  final String description;
  const FromToChild({super.key, required this.fromtotype, required this.location, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 16.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // the plane svg
          Transform.rotate(
            angle: fromtotype == FromToCardType.from ? -45 * (pi / 180) : 45 * (pi / 180),
            child: const Iconify(
              Zondicons.airplane,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          // the content
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // the up and down arrow
                    Icon(
                      (fromtotype == FromToCardType.from)
                          ? Icons.arrow_drop_up_sharp
                          : Icons.arrow_drop_down_sharp,
                      color: CosmixColor.white,
                    ),
                    // the type
                    Text(
                      (fromtotype == FromToCardType.from) ? 'FROM' : 'TO',
                      style: const TextStyle(
                        fontFamily: CosmixFont.fontFamily,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: CosmixColor.white,
                      ),
                    ),
                  ],
                ),
                Text(location.toUpperCase(),style: const TextStyle(fontFamily: CosmixFont.fontFamily, fontSize: 14, color: CosmixColor.white),),
                Text(description,style: const TextStyle(fontFamily: CosmixFont.fontFamily, fontSize: 12,color: CosmixColor.primaryColor),),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // the arrow mark
          const Icon(Icons.arrow_forward_ios_rounded, color: CosmixColor.white),
        ]
      ),
    );
  }
}
