import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

void showToast(String message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0);

// Function to open the dialer
Future<void> dialNumber(String number) async {
  final Uri url = Uri(
    scheme: 'tel',
    path: number,
  );

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> messageNumber(String number, String message) async {
  final Uri url = Uri(
    scheme: 'sms',
    path: number,
    query: Uri.encodeQueryComponent('body=$message'), // Pre-filled message
  );

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
