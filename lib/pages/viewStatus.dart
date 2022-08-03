import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class viewStatus extends StatefulWidget {
  final DocId;
  final img;
  final description;
  final complaint;
  final address;
  final compName;
  final time;
  final mobileNo;
  final status;
  final Address;
  final latitude;
  final longitude;
  const viewStatus(
      {Key? key,
      required this.status,
      required this.DocId,
      required this.img,
      required this.description,
      required this.complaint,
      required this.address,
      required this.compName,
      required this.time,
      required this.mobileNo,
      required this.Address,
      required this.latitude,
      required this.longitude})
      : super(key: key);

  @override
  State<viewStatus> createState() => _viewStatusState();
}

class _viewStatusState extends State<viewStatus> {
  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View status'),
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
            RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Address:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(text: (widget.address)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Complaintor Name:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(text: (widget.compName)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Complaint Date:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                      text: DateFormat.yMMMd().add_jm().format(
                            widget.time.toDate(),
                          )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Mobile NO:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                    text: (widget.mobileNo),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Location:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                    text: (widget.Address),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                      text:
                          'Location: latitude ${widget.latitude}\n longitude ${widget.longitude}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Complaint Status:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                    text: (widget.status),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
