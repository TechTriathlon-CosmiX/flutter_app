import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/button.dart';
import 'package:CosmiX/widgets/input_field.dart';
import 'package:CosmiX/widgets/radio_button.dart';
import 'package:flutter/material.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Payment',
        ),
        backgroundColor: CosmixColor.bgColor,
      ),
      backgroundColor: CosmixColor.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Order Success',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: CosmixColor.subTitleTextColor),
                          ),
                          const Text(
                            'Payment Successful',
                            style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: CosmixColor.primaryColor),
                          ),
                        ],
                      ),
                      Container(
                        child: Ink(
                          decoration: BoxDecoration(
                            color: CosmixColor.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(500.0),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.check,
                                size: 90.0,
                                color: CosmixColor.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Button(
                            onPressed: () {},
                            buttonText: "Go to your orders",
                            type: ButtonType.primaryColor)
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}
