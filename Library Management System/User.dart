import 'Book.dart';

class User {
  String name;
  int id;
  Book? borrowed;

  User({required this.name, required this.id});

  void borrowBook(Book book) {
    if (!book.isBorrowed) {
      borrowed = book;
      book.isBorrowed = true;
      book.borrower = this;
      print('$name borrowed "${book.title}"');
    } else {
      print('This book is already borrowed by ${book.borrower?.name}');
    }
  }

  void returnBook() {
    if (borrowed != null) {
      print('$name returned "${borrowed!.title}"');
      borrowed!.isBorrowed = false;
      borrowed!.borrower = null;
      borrowed = null;
    } else {
      print('$name has no borrowed books to return.');
    }
  }

  void view() {
    print('User name: $name');
    print('User id: $id');
    if (borrowed != null) {
      print('Borrowed book title: ${borrowed!.title}');
    } else {
      print('No borrowed book');
    }
  }
}
