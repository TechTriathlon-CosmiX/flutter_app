import 'package:flutter/material.dart';
import '../widgets/seats.dart';
import '../widgets/input_field.dart';
import '../widgets/button.dart';

class BookingScreen extends StatelessWidget {
  final List<int> selected = [3, 12, 20, 33, 39, 51, 62];
  final List<int> reserved = [7, 27, 45, 54, 55, 56, 63];
  final fieldController = TextEditingController(text: "");

  BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Booking Screen")),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                        'Select Your Cabin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                ),
      
                GridView.custom(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 9,
                  ),
                  shrinkWrap: true,
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      int row = index ~/ 9;
                      int col = index % 9;
      
                      if ((row == 0 && (col == 0 || col == 8))) {
                        return const SizedBox(
                          width: 40,
                          height: 40,
                        );
                      } else if (row == 8 || col != 4) {
                        bool isSelected = selected.contains(index);
                        bool isReserved = reserved.contains(index);
                        return Seats(
                          isSelected: isSelected,
                          isReserved: isReserved,
                        );
                      } else {
                        return const SizedBox(
                          width: 40,
                          height: 40,
                        );
                      }
                    },
                    childCount: 81,
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                    const Text(
                      'Selected',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      color: Color(0xFFBC7E28),
                    ),
                    const Text(
                      'Reserved',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF787878),
                          width: 2.0,
                        ),
                      ),
                    ),
                    const Text(
                      'Available',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
      
                const Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 10.0),
                  child: Text(
                        'Request Excess Baggage',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                ),
      
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Your Package only provides 50 Kg \n For each addition Kilos you will be charged 25000 USD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
      
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        RadioTheme(
                          data: RadioThemeData(
                            fillColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xFF787878)), // Change the color here
                          ),
                          child: Radio<String>(
                            value: 'yes',
                            groupValue: 'selection',
                            onChanged: (value) {
                              // Handle radio button selection
                            },
                          ),
                        ),
                        Text(
                          'Yes',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: 24,),

                    Row(
                      children: [
                        RadioTheme(
                          data: RadioThemeData(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Color(0xFF787878)), // Change the color here
                          ),
                          child: Radio<String>(
                            value: 'no',
                            groupValue: 'selection',
                            onChanged: (value) {
                              // Handle radio button selection
                            },
                          ),
                        ),
                        Text(
                          'No',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 10.0),
                  child: Text(
                    'Additional Requests',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),

                SizedBox(height: 16,),
                InputField(labelText: 'Additional Requests', controller: fieldController),

                SizedBox(height: 32,),
                Button(
                type: ButtonType.primaryColor,
                buttonText: "Proceed to Pay",
                onPressed: (){

                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
