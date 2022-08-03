import 'package:corporateoffice/insidePage/mainPage.dart';
import 'package:corporateoffice/location/location.dart';
import 'package:corporateoffice/pages/contact.dart';
import 'package:corporateoffice/pages/mainPage.dart';
import 'package:corporateoffice/pages/office.dart';

import 'package:corporateoffice/pages/otpTry.dart';
import 'package:corporateoffice/pages/regpage.dart';
import 'package:corporateoffice/pages/streetlight.dart';
import 'package:corporateoffice/widgets/text_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      //home: regPage(),
      home: LoginWithPhone(),
      debugShowCheckedModeBanner: false,
    );
  }
}
