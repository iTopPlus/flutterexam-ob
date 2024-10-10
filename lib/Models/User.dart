class User {
  final int id;
  final String name;
  bool checked;
  final String imageUrl;
  final String phone; 

  User({
    required this.id,
    required this.name,
    this.checked = false,
    required this.imageUrl,
    required this.phone, 
  });
    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'checked': checked,
      'imageUrl': imageUrl,
      'phone': phone,
    };
  }
}
