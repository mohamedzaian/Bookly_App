
import 'package:bookly/core/Features/models/book_model.dart';
import 'package:dio/dio.dart';

class SearchRepo {
  final Dio dio = Dio();

   Future <List<BookModel>> searchData()  async {

    final res = await dio.get('https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:Programming');
    final response = await dio.get('https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
    List<BookModel> books = [];
    List<BookModel> allBooks = [];
    final items = res.data['items'];
    final item = response.data['items'];
    for (var book in items) {
      final bookModel = BookModel.fromJson(book);
      books.add(bookModel);

    }
    for (var book in item) {
      final bookModel = BookModel.fromJson(book);
      books.add(bookModel);

    }
    for (BookModel book in books)
      {

        allBooks.add(book);

      }
return allBooks;

  }



}
void main ()
{
  SearchRepo().searchData();
}

