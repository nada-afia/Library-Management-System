import 'User.dart';
import 'Book.dart';
import 'library system .dart ';
class Librarian extends User {
  String employeeId;

  Librarian({required this.employeeId,required super.name, required super.id});

  void addBook(Book book, Library library) {
    library.booklist.add(book);
    print("Book '${book.title}' added.");
  }

  void removeBook(String code, Library library) {
    library.booklist.removeWhere((book) => book.code == code);
    print("Book with code $code removed.");
  }
}
