import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporateoffice/pages/adminStatusUpload.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Widget buildCard() {
    Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('/corpration/complaints/streetlight')
        .orderBy('created', descending: true)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

              return SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 10,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  shadowColor: Colors.black,
                  borderOnForeground: true,
                  child: Column(
                    children: [
                      ListTile(
                        hoverColor: Colors.white70,
                        title: Text(
                          "${data['complaint']}",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 16),
                        ),
                        subtitle: Text(
                          'Updated :' +
                              DateFormat.yMMMd()
                                  .add_jm()
                                  .format(data['created'].toDate()),
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14),
                        ),
                        //trailing: Icon(Icons.keyboard_arrow_right),
                        // onTap: () {
                        //  Get.to(pdfView(path: data['download']));
                        //  print(data['download']);
                        //},
                      ),
                      ButtonBar(
                        //alignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            // textColor: const Color(0xFF6200EE),
                            onPressed: () {
                              // Perform some action
                              Get.to(adminStatus(
                                DocId: document.id,
                                time: data['created'],
                                description: data['description'],
                                img: data['download'],
                                complaint: data['complaint'],
                                address: data['address'],
                                compName: data['name'],
                                mobileNo: data['mobileNo'],
                              ));

                              print(document.id);
                              print(data['address']);
                              // try to download
                            },
                            child: const Text('View'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Admin"),
        ),
        body: buildCard());
  }
}
