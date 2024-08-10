class CustomExeption implements Exception {
  final String message;
  final String? details;

  CustomExeption(this.message, {this.details});

  @override
  String toString() {
    return message;
  }
}
