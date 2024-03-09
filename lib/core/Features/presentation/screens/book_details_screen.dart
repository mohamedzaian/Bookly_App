import 'package:bookly/core/Features/presentation/widgets/book_details_body.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.image, required this.title, required this.author, required this.price, required this.description, required this.link, required this.contentLink});
  final String image;
  final String title;
  final String author;
  final String price;
  final String description;
  final String link;
  final String contentLink;

  @override
  Widget build(BuildContext context) {
    return BookDetailsBody(image: this.image, title: this.title, author: this.author, price: this.price,description: this.description,link:this.link ,contantLink: this.contentLink,);
  }
}
