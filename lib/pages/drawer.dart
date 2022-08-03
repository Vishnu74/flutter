import 'package:corporateoffice/insidePage/BusPass.dart';
import 'package:corporateoffice/pages/complaints.dart';
import 'package:corporateoffice/pages/contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class drawerPage extends StatefulWidget {
  final String uid;
  final String mobileNo;
  const drawerPage({Key? key, required this.uid, required this.mobileNo})
      : super(key: key);

  @override
  State<drawerPage> createState() => _drawerPageState();
}

class _drawerPageState extends State<drawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Material(
        //color: Color.fromRGBO(50, 75, 205, 1.0),
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,

          // Important: Remove any padding from the ListView.

          children: [
            ListTile(
              title: const Text('Complaint Page',
                  style: TextStyle(color: Colors.black)),
              hoverColor: Colors.white70,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Complaint'),
              onTap: () {
                Get.to(ComplaintPage(
                  uid: widget.uid,
                  mobileNo: widget.mobileNo,
                ));
              },
            ),
            ListTile(
              title: const Text('Contact us'),
              onTap: () {
                Get.to(ContactUs(
                  uid: '${widget.mobileNo}',
                ));
              },
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              title: const Text('E-adhar'),
              onTap: () {
                Get.to(Roadspage());
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
