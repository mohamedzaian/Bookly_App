import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key, required this.description, required this.title});
  final String description;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xff100B20),
        title: Text('description'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        onPressed: ()
          {
            Navigator.of(context).pop();
          },),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(title,style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: 30,),
            Text (description,
            maxLines: 20,style: TextStyle(
                fontSize: 20
              ),),
          ],
        ),
      ),
    );
  }
}
