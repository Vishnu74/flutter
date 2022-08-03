import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUs extends StatefulWidget {
  final String uid;
  const ContactUs({Key? key, required this.uid}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

TextEditingController _name = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _feedback = TextEditingController();

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: Container(
        padding: EdgeInsets.all(01),
        margin: EdgeInsets.all(05),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "Contact us",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Public Welfare and  Public Service",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          hintText: "NAME",
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none),
                      controller: _name,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Email",
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none),
                      controller: _email,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      maxLines: 7,
                      decoration: InputDecoration(
                          hintText: "FeedBack",
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none),
                      controller: _feedback,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      height: 45,
                      minWidth: double.infinity,
                      color: Color(0xff333333),
                      onPressed: () {
                        upload();
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  upload() {
    CollectionReference users = FirebaseFirestore.instance
        .collection('corpration/complaints/feedback/');
    DateTime now = new DateTime.now();
    users
        .add({
          'name': _name.text,
          'email': _email.text,
          'feedback': _feedback.text,
          'created': now,
          'uid': widget.uid,
        })
        .then((value) => Get.snackbar("Success", "data Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
