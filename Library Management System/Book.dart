import 'User.dart';

class Book {
  int code;
  String title;
  bool isBorrowed = false;
  User? borrower;

  Book({required this.code, required this.title});

  void view() {
    print('Book code: $code');
    print('Book title: $title');
    print('Book isBorrowed: $isBorrowed');
    if (borrower != null) {
      print('Borrowed by: ${borrower!.name}');
    } else {
      print('This book is available');
    }
  }
}
