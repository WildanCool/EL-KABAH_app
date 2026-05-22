class AmalanModel {

  final int? id;
  final String category;
  final String title;
  final String arab;
  final String latin;
  final String arti;

  AmalanModel({
    this.id,
    required this.category,
    required this.title,
    required this.arab,
    required this.latin,
    required this.arti,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "category": category,
      "title": title,
      "arab": arab,
      "latin": latin,
      "arti": arti,
    };
  }

  factory AmalanModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return AmalanModel(
      id: map["id"],
      category: map["category"],
      title: map["title"],
      arab: map["arab"],
      latin: map["latin"],
      arti: map["arti"],
    );
  }
}