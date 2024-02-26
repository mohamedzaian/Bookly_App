import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  final backgroundColor = Color(0xff100B20);
  final logo = 'assets/images/Logo.png';
}

class GetLink
{
  Future getlink (String link) async

  {
    final Uri url = Uri.parse(link);
    await launchUrl(url);
  }
}
