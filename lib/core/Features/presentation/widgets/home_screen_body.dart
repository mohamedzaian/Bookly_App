import 'package:bookly/constants.dart';
import 'package:bookly/core/Features/models/book_model.dart';
import 'package:bookly/core/Features/presentation/screens/book_details_screen.dart';
import 'package:bookly/core/Features/repos/book_repo.dart';
import 'package:bookly/core/Features/repos/newest_book_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 26, vertical: 50.0),
              child: FutureBuilder(
                future: null,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final books = snapshot.data;
                    return AppBar(books:books ,);
                    }return SizedBox();
                  }

              ),
            ),
            ListOfBooks(),
            SizedBox(
              height: 50,
            ),
            Text(
              'Newest Book',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            ListOfNewestBook(),
          ],
        ),
      ),
    );
  }
}
// ----------------------------------------------------------------------------------------------------------------------------
// Widgets

class ListOfNewestBook extends StatelessWidget {
  const ListOfNewestBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NewestBookRepo().getNewestBook(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final List listOfBook = snapshot.data;
            return Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    final BookModel item = listOfBook[i];


                    return GestureDetector(
                      onTap: () {
                        Get.to(
                            () => BookDetailsScreen(
                                  description: item.volumeInfo.description,
                                  image: item.volumeInfo.imageLinks.thumbnail,
                                  title: item.volumeInfo.title,
                                  author: item.volumeInfo.authors.first,
                                  price: 'Free',
                                  link: item.volumeInfo.previewLink,
                                  contentLink:
                                      item.volumeInfo.canonicalVolumeLink,
                                ),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 500));
                      },
                      child: Container(
                        height: 105,
                        child: Row(
                          children: [
                            Container(
                              height: 105,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        item.volumeInfo.imageLinks.thumbnail),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 52,
                                  width: 193,
                                  child: Text(
                                    item.volumeInfo.title,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  item.volumeInfo.authors.first,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Colors.grey),
                                ),
                                Text(
                                  'Free',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, i) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: listOfBook.length),
            );
          }
          return SizedBox(
            child: Text('mohamed'),
          );
        });
  }
}

class ListOfBooks extends StatelessWidget {
  const ListOfBooks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: BookRepo().getBook(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final List listOfitems = snapshot.data;

            return Container(
              height: 250,
              child: ListView.separated(
                  separatorBuilder: ((context, i) {
                    return SizedBox(
                      width: 20,
                    );
                  }),
                  itemCount: listOfitems.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    final BookModel item = listOfitems[i];
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                                () => BookDetailsScreen(
                              description: item.volumeInfo.description,
                              image: item.volumeInfo.imageLinks.thumbnail,
                              title: item.volumeInfo.title,
                              author: item.volumeInfo.authors.first,
                              price: 'Free',
                              link: item.volumeInfo.previewLink,
                              contentLink:
                              item.volumeInfo.canonicalVolumeLink,
                            ),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 500));
                      },

                      child: Container(
                        height: 224,
                        width: 150,
                        // child: Image.network(book.volumeInfo.imageLinks.thumbnail),

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(
                                    item.volumeInfo.imageLinks.thumbnail),
                                fit: BoxFit.fill)),
                      ),
                    );
                  }),
            );
          }
          return SizedBox(
            child: Text('mohamed'),
          );
        });
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key, required this.books,
  });
  final books;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Utils().logo,
          height: 18,
        ),
        Spacer(),
       IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search(books));
              },
              icon: Icon(
                Icons.search,
                size: 26,
              ),


        )
      ],
    );
  }
}

class Search extends SearchDelegate

{
   late final List book;
   List Books = [];
   Search(this.book);








  @override
  List<Widget>? buildActions(BuildContext context) {
 return
     [
       IconButton(onPressed: ()
           {
             query  = '';
           }, icon: Icon(Icons.clear))
     ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: ()
    {
     close(context, null);
    }, icon: Icon(Icons.arrow_back));

  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  if (query == '')
    {
      return ListView.builder(itemBuilder: (context,i)
      {
        final BookModel books=this.book[i];

        return Card(child: Text(books.volumeInfo.title),);
      });


    }
  else
    {
     return Text('');

    }
  }


}
