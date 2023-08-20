import 'package:CosmiX/screens/main_screen.dart';
import 'package:CosmiX/screens/my_trips_screen.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      const Column(
                        children: [
                          Text(
                            'Order Success',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: CosmixColor.subTitleTextColor),
                          ),
                          Text(
                            'Payment Successful',
                            style: TextStyle(
                              
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: CosmixColor.primaryColor),
                          ),
                        ],
                      ),
                      Ink(
                        decoration: const BoxDecoration(
                          color: CosmixColor.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(500.0),
                          child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.check,
                              size: 90.0,
                              color: CosmixColor.white,
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
                            onPressed: () {
                              Get.to(() => MainScreen());
                            },
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
