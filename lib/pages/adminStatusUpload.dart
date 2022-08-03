import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class adminStatus extends StatefulWidget {
  final DocId;
  final img;
  final description;
  final complaint;
  final address;
  final compName;
  final time;
  final mobileNo;
  const adminStatus(
      {Key? key,
      required this.DocId,
      required this.img,
      required this.description,
      required this.complaint,
      required this.address,
      required this.compName,
      required this.time,
      required this.mobileNo})
      : super(key: key);

  @override
  State<adminStatus> createState() => _adminStatusState();
}

class _adminStatusState extends State<adminStatus> {
  TextEditingController _updateStatus = TextEditingController();
  String dropdownvalue = 'VIEWED';

  // List of items in our dropdown menu
  var items = [
    'VIEWED',
    'IN PROCESS',
    'PENDING',
    'COMPLETED',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('upload status'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network('${widget.img}'),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.complaint,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.description,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Address:' + widget.address,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Complaint creator Name:' + widget.compName,
              style: TextStyle(decorationStyle: TextDecorationStyle.dashed),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Complaint Created date:' +
                DateFormat.yMMMd().add_jm().format(widget.time.toDate())),
            SizedBox(
              height: 20,
            ),
            Text('Mobile NO:' + widget.mobileNo),
            SizedBox(
              height: 20,
            ),
            DropdownButton(
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  print(dropdownvalue);
                  upload();
                },
                child: Text('Upload Status'))
          ],
        ),
      ),
    );
  }

  Future<void> upload() async {
    print(widget.DocId);
    FirebaseFirestore.instance
        .collection('/corpration/complaints/streetlight/')
        .doc('${widget.DocId}')
        .set(
          {'status': dropdownvalue.toString()},
          SetOptions(merge: true),
        )
        .then((value) => print("User value changed"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
