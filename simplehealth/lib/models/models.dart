class Models {
  final String id;
  final int created;
  final String root;

  Models({
    required this.id,
    required this.root,
    required this.created,
  });

  factory Models.fromJson(Map<String, dynamic> json) => Models(
        id: json["id"],
        root: json["root"],
        created: json["created"],
      );

  static List<Models> modelsFromSnapshot(List modelSnapshot) {
    return modelSnapshot.map((data) => Models.fromJson(data)).toList();
  }
}
