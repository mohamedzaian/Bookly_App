import 'package:bookly/constants.dart';
import 'package:bookly/core/Features/models/book_model.dart';
import 'package:bookly/core/Features/presentation/screens/description_screen.dart';
import 'package:bookly/core/Features/repos/book_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsBody extends StatelessWidget {
  BookDetailsBody(
      {super.key,
      required this.image,
      required this.title,
      required this.author,
      required this.price,

        required this.description, required this.link, required this.contantLink
      });


  final String image;
  final String title;
  final String author;
  final String price;
  final String description;
  final String link;
final String contantLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(),
            SizedBox(
              height: 35,
            ),
            Image(image: image),
            SizedBox(
              height: 40,
            ),
            Title(title: title),
            SizedBox(
              height: 4,
            ),
            Author(author: author),
            SizedBox(
              height: 14,
            ),
            Rate(),
            SizedBox(
              height: 20,
            ),
           CustomButton(price: price, description: description, title: title,link: link,contentLink: contantLink,),

          ],
        ),
      ),
    );
  }
}



class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.price, required this.description, required this.title, required this.link, required this.contentLink,
  });
final String description;
final String title;
  final String price;
  final String link;
  final String contentLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextButton(
                onPressed: () async{
                  await GetLink().getlink(link);
                },
                child: Text(
                  'Free',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.white,
                    fixedSize: Size(150, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)
                  )
                )),
            ),
          ),
          Expanded(
            child: TextButton(
                onPressed: ()async {

                  await GetLink().getlink(contentLink);

                },
                child: Text(
                  'Preview',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: TextButton.styleFrom(backgroundColor: Color(0xffEF8262)
                    ,fixedSize: Size(150, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)
                  )
                )),
            ),
          ),

        ],
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    );
  }
}

class Rate extends StatelessWidget {
  const Rate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        Text(
          ' 4.8',
          style: TextStyle(color: Colors.white, fontSize: 16),
        )
      ],
    );
  }
}

class Author extends StatelessWidget {
  const Author({
    super.key,
    required this.author,
  });

  final String author;

  @override
  Widget build(BuildContext context) {
    return Text(
      author,
      style: TextStyle(
          fontWeight: FontWeight.w700, fontSize: 18, color: Colors.grey),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class Image extends StatelessWidget {
  const Image({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 243,
      width: 162,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill)),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.clear)),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
      ],
    );
  }

}
