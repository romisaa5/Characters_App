class Character {
  late int charId;
  late String name;
  late String gender;
  late String image;
  late List<String> episode;
  late String status;

  Character.fromJson(Map<String, dynamic> json) {
    charId = json['id'];
    name = json['name'];
    gender = json['gender'];
    image = json['image'];
    episode = List<String>.from(json['episode']);
    status = json['status'];
  }
}
