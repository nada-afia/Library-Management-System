import 'dart:io';
import 'Book.dart';
import 'User.dart';

class Library {
  List<Book> booklist = [];
  List<User> userlist = [];

  Library() {
    addTestData();
  }

  void addTestData() {
    for (int i = 1; i <= 20; i++) {
      Book book = Book(code: i, title: 'Book title $i');
      User user = User(name: 'User $i', id: i );
      booklist.add(book);
      userlist.add(user);
    }
  }

  void addNewBook() {
    print('Enter book code:');
    int code = int.parse(stdin.readLineSync()!);
    print('Enter book title:');
    String title = stdin.readLineSync()!;
    Book newBook = Book(code: code, title: title);
    booklist.add(newBook);
    print('Book added.');
  }

  void borrowing(int code, User user) {
    for (Book book in booklist) {
      if (book.code == code) {
        if (book.isBorrowed) {
          print('Book is already borrowed.');
          return;
        }
        user.borrowBook(book);
        return;
      }
    }
    print('Book not found.');
  }

  void returning(int code) {
    for (Book book in booklist) {
      if (book.code == code) {
        if (!book.isBorrowed) {
          print('Book is not borrowed.');
          return;
        }
        User? borrower = book.borrower;
        borrower?.returnBook();
        return;
      }
    }
    print('Book not found.');
  }

  void showAllBooks() {
    for (var book in booklist) {
      print('------------------');
      book.view();
    }
  }

  void showAllUsers() {
    for (var user in userlist) {
      print('------------------');
      user.view();
    }
  }

  void showMenu() {
    while (true) {
      print('1 - Add New Book');
      print('2 - Borrow Book');
      print('3 - Return Book');
      print('4 - Show All Books');
      print('5 - Show All Users');
      print('6 - Exit');
      print('Enter choice:');

      int choice = int.parse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          addNewBook();
          break;
        case 2:
          print('Enter user ID(note: we have only 20 users):');
          int uid = int.parse(stdin.readLineSync()!);
          User? user;
          try {
            user = userlist.firstWhere((u) => u.id == uid);
          } catch (e) {
            user = null;
          }

          if (user == null) {
            print('User not found.');
            break;
          }
          print('Enter book code:');
          int bcode = int.parse(stdin.readLineSync()!);
          borrowing(bcode, user);
          break;
        case 3:
          print('Enter book code:');
          int bcode = int.parse(stdin.readLineSync()!);
          returning(bcode);
          break;
        case 4:
          showAllBooks();
          break;
        case 5:
          showAllUsers();
          break;
        case 6:
          print('Exiting...');
          return;
        default:
          print('Invalid choice.');
      }
    }
  }
}
void main() {
  Library lib = Library();
  lib.showMenu();
}
