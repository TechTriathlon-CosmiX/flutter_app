class SpaceshipScreen extends StatelessWidget {
  const SpaceshipScreen({super.key});

  final List<String> facilitiesList = ['Gym', 'Swimming Pool', 'Spa and Saloon', '24/7 Convince Store','Kids Play Area']; //get facility list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Spaceship Details',
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
                    Image.asset(
                      'assets/images/spaceships/voyager.png',
                      height: 100,
                    ),
                    Column(
                      children: [
                        const Text(
                          'Galactic Skyways', // get spaceline name
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: CosmixColor.subTitleTextColor,
                          ),
                        ),
                        const Text(
                          'Voyager', // get spaceship name
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: CosmixColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        'No. of Passengers',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: CosmixColor.subTitleTextColor,
                        ),
                      ),
                      children: [
                        const Text(
                          '250', // get passenger count
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: CosmixColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        'No. of Cabins',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: CosmixColor.subTitleTextColor,
                        ),
                      ),
                      children: [
                        const Text(
                          '200', // get cabin count
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: CosmixColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        'Facilities',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: CosmixColor.subTitleTextColor,
                        ),
                      ),
                      children: [
                            for (var facility in facilitiesList)
                              Text(
                                facility,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: CosmixColor.primaryColor,
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      onPressed: () {
                        Get.to(() => PaymentScreen());
                      },
                      buttonText: "Select Spaceship",
                      type: ButtonType.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
