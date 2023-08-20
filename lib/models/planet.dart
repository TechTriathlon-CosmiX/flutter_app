class Planet{
  String planetName;
  String planetId;
  String planetDescription;
  String planetImage;

  Planet({required this.planetName,required this.planetId,required this.planetDescription,required this.planetImage});

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      planetId: json['planetId'],
      planetName: json['planetName'],
      planetImage: json['image'],
      planetDescription: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'planetId': planetId,
      'planetName': planetName,
      'image': planetImage,
      'description': planetDescription
    };
  }
}