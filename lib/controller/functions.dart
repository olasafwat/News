import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Functions
{
 static void shareLink(String link)
  {
    Share.share(
        '$link',
        subject: 'The Link Shared by News App');

  }

  static void copyLink(String link,var context)
  {
   FlutterClipboard.copy('$link')
       .then(( value ) {
    Scaffold.of(context).showSnackBar(new SnackBar(
     content: new Text('Copy Done!'),
    ));
   });
  }

  static void openLink(String link) async
  {
   if (!await launchUrl(
   Uri.parse(link)))
  throw 'Could not launch ${link}';

  }
}