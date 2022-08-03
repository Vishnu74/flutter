import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class onlineServicePage extends StatelessWidget {
  const onlineServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 93, 123, 1),
      appBar: AppBar(
        title: Text('Online services'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Card(
                color: Colors.white60,
                shadowColor: Colors.black,
                child: ListTile(
                  hoverColor: Colors.green,
                  title: Text(
                    'Birth And Death certificate',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    _launchInApp('https://www.crstn.org/birth_death_tn/');
                  },
                ),
              ),
              Card(
                color: Colors.white60,
                shadowColor: Colors.black,
                child: ListTile(
                  hoverColor: Colors.green,
                  title: Text(
                    'E-aadhar',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                  onTap: () {
                    _launchInApp(
                        'https://uidai.gov.in/my-aadhaar/get-aadhaar.html');
                  },
                ),
              ),
              Card(
                color: Colors.white60,
                shadowColor: Colors.black,
                child: ListTile(
                  hoverColor: Colors.green,
                  title: Text(
                    'Electricity bill',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                  onTap: () {
                    _launchInApp('https://www.tnebnet.org/qwp/qpay');
                  },
                ),
              ),
              Card(
                color: Colors.white60,
                shadowColor: Colors.black,
                child: ListTile(
                  hoverColor: Colors.green,
                  title: Text(
                    'Bus Pass Renewal',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                  onTap: () {
                    _launchInApp(
                        'https://tnstc.wordpress.com/2016/03/15/tnstcs-concessional-bus-pass-scheme-needs-better-reach/');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launchInApp(String url) async {
  if (!await launch(
    url,
    forceSafariVC: true,
    forceWebView: true,
    enableJavaScript: true,
    universalLinksOnly: true,
    enableDomStorage: true,
    headers: <String, String>{'my_header_key': 'my_header_value'},
  )) {
    throw 'Could not launch $url';
  }
}
