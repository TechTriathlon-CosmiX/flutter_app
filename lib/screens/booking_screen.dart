import 'package:flutter/material.dart';
import '../widgets/seats.dart';

class BookingScreen extends StatelessWidget {
  final List<int> selected = [3, 12, 20, 33, 39, 51, 62];
  final List<int> reserved = [7, 27, 45, 54, 55, 56, 63];

  BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Booking Screen")),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
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
              SizedBox(height: 15,),
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
            ],
          ),
        ),
      ),
    );
  }
}
