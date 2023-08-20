import 'package:flutter/material.dart';

import '../theme/colors.dart';

class StepIndicator extends StatelessWidget {
  final int numberOfSteps;
  final int currentStep;

  const StepIndicator(
      {super.key, required this.numberOfSteps, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        Text(
          "STEP $currentStep OF $numberOfSteps",
          style: const TextStyle(color: CosmixColor.lightGrey, fontSize: 12),
        ),
        const SizedBox(height: 8.0),
        // Generate steps according to the number of steps,
        // if it current step, show selected step widget,
        // else show unselected step widget
        SizedBox(
          height: 6,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: numberOfSteps,
            itemBuilder: (context, index) {
              if (index + 1 == currentStep) {
                return _selectedStep();
              } else {
                return _unselectedStep();
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _unselectedStep() {
    return Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
        child: Container(
          width: 6,
          height: 6,
          decoration: ShapeDecoration(
            color: CosmixColor.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
        ));
  }

  Widget _selectedStep() {
    return Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
        child: Container(
          width: 12,
          height: 6,
          decoration: ShapeDecoration(
            color: CosmixColor.grey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
        ));
  }
}
