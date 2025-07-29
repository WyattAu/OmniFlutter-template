abstract class TodoInterface {
  String get id;
  String get title;
  String? get description;
  bool get isCompleted;
  DateTime get createdAt;
  DateTime get updatedAt;
  String? get userId;
  
  Map<String, dynamic> toMap();
  Map<String, dynamic> toJson();
}