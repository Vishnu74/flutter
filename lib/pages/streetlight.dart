import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporateoffice/pages/drawer.dart';
import 'package:corporateoffice/pages/location.dart';
import 'package:corporateoffice/pages/regpage.dart';
import 'package:corporateoffice/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';

class streetpage extends StatefulWidget {
  final String uid;
  const streetpage({Key? key, required this.uid}) : super(key: key);

  @override
  State<streetpage> createState() => _streetpageState();
}

class _streetpageState extends State<streetpage> {
  String dropdownvalue = "Complaint";
  var ChooseComplaint = [
    "Light Issue",
    "Road Issue",
    "Garbage Disposable",
    "Water Issue",
  ];
  var hintChooseComplaint = "ChooseComplaint";
  var valueComplaint;
  var valueChoose;
  var one;
  bool _isLoading = false;
  String fileName = "";
  var _progress;
  TextEditingController _MobileNumber = TextEditingController();
  TextEditingController _Street = TextEditingController();
  TextEditingController _fullName = TextEditingController();
  TextEditingController _description = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  var inputBorder = OutlineInputBorder();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      //drawer: drawerPage(),
      appBar: AppBar(
        title: Text("Track your Complaint Page"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter your number',
                        border: OutlineInputBorder()),
                    controller: _MobileNumber,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter correct number';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter your Full name',
                        border: OutlineInputBorder()),
                    controller: _fullName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter correct number';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter your street',
                        border: OutlineInputBorder()),
                    controller: _Street,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter correct number';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter the description',
                        border: OutlineInputBorder()),
                    controller: _description,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter correct number';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.1, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    )),
                    child: DropdownButton(
                        isExpanded: true,
                        elevation: 0,
                        hint: Text(hintChooseComplaint),
                        items: ChooseComplaint.map((String item) {
                          return DropdownMenuItem(
                            child: Text(item),
                            value: item,
                          );
                        }).toList(),
                        value: valueComplaint,
                        onChanged: (value) {
                          setState(() {
                            this.hintChooseComplaint = value.toString();
                            this.valueComplaint = value.toString();
                            print(valueComplaint);
                          });
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      selectFile();
                      // upload();
                    },
                    child: Container(
                      child: Text('choose file'),
                      width: 100,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(fileName),
                  InkWell(
                    onTap: () {
                      // CollectionReference users = FirebaseFirestore.instance
                      //     .collection('corpration/complaints/streetlight/');
                      // DateTime now = new DateTime.now();
                      // users
                      //     .add({
                      //       'mobileNo': _MobileNumber.text,
                      //       //'filename': fileName,
                      //       // 'download': downloadUrl,
                      //       'created': now,
                      //       'name': _fullName.text,
                      //       'addr
                      //       ess': _Street.text
                      //     })
                      //     .then(
                      //         (value) => Get.snackbar("Success", "data Added"))
                      //     .catchError(
                      //         (error) => print("Failed to add user: $error"));
                      if (_formKey.currentState!.validate()) {
                        print('validate');
                        upload();
                        // final snackbar = SnackBar(content: Text('submitt'));
                        // SnackBar(content: Text('submitting form'));
                        // _scaffoldKey.currentState!.showSnackBar(snackbar);
                      } else {
                        print('not validate');
                      }

                      // CollectionReference users = FirebaseFirestore.instance
                      //     .collection('corpration/complaints/streetlight/');
                      // DateTime now = new DateTime.now();
                      // users
                      //     .add({
                      //       'mobileNo': _Regmobile.text,
                      //     })
                      //     .then((value) => Get.snackbar("Success", "data Added"))
                      //     .catchError(
                      //         (error) => print("Failed to add user: $error"));
                    },
                    child: Container(
                      child: _isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text('Submit',
                              style: TextStyle(color: Colors.white)),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    print(result!.files.single.path);
    one = result.files.single.path;
    fileName = result.files.first.name;

    if (result != null) {
      setState(() {
        one = result.files.single.path;
        String fileName = result.files.first.name;
      });
    } else {
      // User canceled the picker
      print('sorry');
    }
  }

  Future<void> upload() async {
    setState(() {
      _isLoading = true;
    });

    try {
      Position position = await tryLocation().getLocation();
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      print(placemarks);
      Placemark place = placemarks[0];
      var Address =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      File file = File(one!);
      var uploadTask =
          FirebaseStorage.instance.ref('try/$fileName').putFile(file);
      uploadTask.snapshotEvents.listen((event) {
        setState(() {
          _progress =
              event.bytesTransferred.toDouble() / event.totalBytes.toDouble();
          print(_progress.toString());
        });
        if (event.state == TaskState.success) {
          _progress = null;
        }
      }).onError((error) {
        // do something to handle error
        print('error');
      });

      TaskSnapshot snap = await uploadTask;

      String downloadUrl = await snap.ref.getDownloadURL();
      print(downloadUrl);

      CollectionReference users = FirebaseFirestore.instance
          .collection('corpration/complaints/streetlight/');
      DateTime now = new DateTime.now();
      users
          .add({
            'description': _description.text,
            'mobileNo': _MobileNumber.text,
            'filename': fileName,
            'download': downloadUrl,
            'created': now,
            'name': _fullName.text,
            'address': _Street.text,
            'complaint': valueComplaint.toString(),
            'uid': '${widget.uid}',
            'latitude': '${position.latitude}',
            'longitude': '${position.longitude}',
            'locationAddress': Address.toString()
          })
          .then((value) => Get.snackbar("Success", "data Added"))
          .catchError((error) => print("Failed to add user: $error"));

      print(downloadUrl);
      print('upload');
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    // creating location to our firebase storage
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
