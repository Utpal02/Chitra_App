import 'package:chitra_app/Login/otp.dart';
import 'package:chitra_app/Login/phone.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'phone',
    routes: {
      'phone' : (context) => MyPhone(),
      'otp'   : (context) => MyOtp()
    },
  ));
}

