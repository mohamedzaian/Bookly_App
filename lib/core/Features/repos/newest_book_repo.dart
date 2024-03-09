import 'package:bookly/core/Features/models/book_model.dart';
import 'package:dio/dio.dart';

class NewestBookRepo {
  final Dio dio = Dio();

  Future  getNewestBook() async {
    final res = await dio.get('https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
    final List<BookModel> books = [];
    final items = res.data['items'];
    for (var book in items) {
      final bookModel = BookModel.fromJson(book);
      books.add(bookModel);

    }

    return books;
  }
}
void main () async
{

  print( await NewestBookRepo().getNewestBook());
}


