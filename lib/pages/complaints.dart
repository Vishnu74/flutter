import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporateoffice/pages/viewStatus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class ComplaintPage extends StatefulWidget {
  final String uid;
  final String mobileNo;

  const ComplaintPage({
    Key? key,
    required this.uid,
    required this.mobileNo,
  }) : super(key: key);

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  Widget buildCard() {
    print(widget.uid);
    print(widget.mobileNo);
    Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('/corpration/complaints/streetlight')
        .where('uid', isEqualTo: widget.uid)
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
                            //textColor: const Color(0xFF6200EE),
                            onPressed: () {
                              Get.to(viewStatus(
                                status: data['status'],
                                DocId: document.id,
                                time: data['created'],
                                description: data['description'],
                                img: data['download'],
                                complaint: data['complaint'],
                                address: data['address'],
                                compName: data['name'],
                                mobileNo: data['mobileNo'],
                                Address: data['locationAddress'],
                                longitude: data['longitude'],
                                latitude: data['latitude'],
                              ));
                              // Perform some action

                              // try to download
                            },
                            //child: const Text('delete),
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
          title: Text("COMPLAINT"),
        ),
        body: buildCard());
  }
}
