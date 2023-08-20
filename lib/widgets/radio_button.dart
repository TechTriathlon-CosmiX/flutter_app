import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';

class RadioField extends StatefulWidget {
  const RadioField({super.key});

  @override
  State<RadioField> createState() => _RadioFieldState();
}

enum PaymentMethod { SpaceVisa, MasterCard }

class _RadioFieldState extends State<RadioField> {
  PaymentMethod? _character = PaymentMethod.SpaceVisa;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            const Text(
              'Space Visa',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: CosmixColor.white),
            ),
            Radio<PaymentMethod>(
              value: PaymentMethod.SpaceVisa,
              groupValue: _character,
              onChanged: (PaymentMethod? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ],
        ),
        SizedBox(width: 20), // Add spacing between radio buttons
        Row(
          children: [
            const Text(
              'MasterCard',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: CosmixColor.white),
            ),
            Radio<PaymentMethod>(
              value: PaymentMethod.MasterCard,
              groupValue: _character,
              onChanged: (PaymentMethod? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
