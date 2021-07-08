class HomeTileModel {
  HomeTileModel({
    required this.title,
    required this.date,
    required this.text,
    required this.imagePath,
    this.isChecked = false,
    this.id,
  });

  final String title;
  final DateTime date;
  final String text;
  final String imagePath;
  final int? id;
  bool isChecked;
}
