import 'package:CosmiX/screens/payment_successful_screen.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/button.dart';
import 'package:CosmiX/widgets/input_field.dart';
import 'package:CosmiX/widgets/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController accountNoController = TextEditingController();
    TextEditingController expireDateController = TextEditingController();
    TextEditingController cvcController = TextEditingController();
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
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Total Amount',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: CosmixColor.subTitleTextColor),
                          ),
                          const Text(
                            '10 MILLION USD',
                            style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: CosmixColor.primaryColor),
                          ),
                        ],
                      ),
                      const Center(child: RadioField()),
                      InputField(
                        labelText: "Card Holders Name",
                        controller: nameController,
                        leadingIcon: const Icon(Icons.account_box_rounded),
                      ),
                      InputField(
                        labelText: "Card Number",
                        controller: accountNoController,
                        leadingIcon: const Icon(Icons.card_membership_rounded),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputField(
                              labelText: "Expire Date",
                              controller: expireDateController,
                              leadingIcon:
                                  const Icon(Icons.calendar_month_rounded),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: InputField(
                              labelText: "CVV",
                              controller: cvcController,
                              leadingIcon:
                                  const Icon(Icons.lock_outline_rounded),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Button(
                            onPressed: () {},
                            buttonText: "Pay",
                            type: ButtonType.primaryColor)
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}
