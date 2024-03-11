import 'package:bookly/core/Features/models/book_model.dart';
import 'package:dio/dio.dart';

class BookRepo {
  final Dio dio = Dio();

  Future getBook() async {
    final res = await dio.get('https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:Programming');
     List<BookModel> books = [];
    final items = res.data['items'];
    for (var book in items) {
      final bookModel = BookModel.fromJson(book);
      books.add(bookModel);

    }

    return books;
  }
}





