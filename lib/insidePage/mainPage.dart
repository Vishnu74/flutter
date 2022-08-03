import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:corporateoffice/insidePage/department.dart';
import 'package:corporateoffice/insidePage/onlinePayment.dart';
import 'package:corporateoffice/insidePage/onlineServices.dart';
import 'package:corporateoffice/pages/drawer.dart';
import 'package:corporateoffice/pages/streetlight.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

//notification try

class mainScreenPage extends StatefulWidget {
  const mainScreenPage({Key? key}) : super(key: key);

  @override
  State<mainScreenPage> createState() => _mainScreenPageState();
}

class _mainScreenPageState extends State<mainScreenPage> {
  var _connectionStatus;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  var uid;
  var mobileNo;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        setState(() {
          uid = user.uid;
          mobileNo = user.phoneNumber!;
        });
        print('');
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        // case ConnectivityResult.none:
        setState(() => _connectionStatus = true);
        print(_connectionStatus);

        break;
      default:
        setState(() => _connectionStatus = false);
        print(_connectionStatus);
        break;
    }
  }

  Widget getConnection() {
    if (_connectionStatus == true) {
      return Scaffold(
          backgroundColor: Colors.grey[350],
          drawer:
              drawerPage(uid: uid.toString(), mobileNo: mobileNo.toString()),
          appBar: AppBar(
            title: Text('Corporation'),
          ),
          body: ListView(
            children: [
              SizedBox(
                height: 200.0,
                child: Image.asset(
                  'assets/cor.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 15,
                child: InkWell(
                  onTap: () {
                    print('some');
                  },
                  child: Marquee(
                    text: 'Coimbatore city',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 20.0,
                    velocity: 100.0,
                    pauseAfterRound: Duration(seconds: 1),
                    startPadding: 10.0,
                    accelerationDuration: Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: Duration(milliseconds: 600),
                    decelerationCurve: Curves.easeOut,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                color: Colors.cyan,
                shadowColor: Colors.black,
                child: ListTile(
                  hoverColor: Colors.green,
                  title: Text(
                    'Department',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Get.to(departmentPage());
                  },
                ),
              ),
              InkWell(
                child: Card(
                  color: Colors.cyan,
                  shadowColor: Colors.black,
                  child: ListTile(
                    hoverColor: Colors.white70,
                    title: Text(
                      'Property Tax',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.to(Home());
                    },
                  ),
                ),
              ),
              Card(
                color: Colors.cyan,
                shadowColor: Colors.black,
                child: ListTile(
                  hoverColor: Colors.white70,
                  title: Text(
                    'Online services',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Get.to(onlineServicePage());
                  },
                ),
              ),
              Card(
                color: Colors.cyan,
                shadowColor: Colors.black,
                child: ListTile(
                  hoverColor: Colors.white70,
                  title: Text(
                    'post Grievance',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Get.to(streetpage(uid: uid));
                  },
                ),
              ),
            ],
          ));
    } else if (_connectionStatus == false) {
      return Scaffold(
          body: Column(
        children: [
          Text("no connection"),
        ],
      ));
    } else {
      return Scaffold(
          //body: Text("somthing wrong"),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : getConnection();
  }
}
