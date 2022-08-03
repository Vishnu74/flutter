import 'package:corporateoffice/pages/drawer.dart';
import 'package:corporateoffice/pages/streetlight.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  final double coverHeight = 200;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late String uid;
  late String mobileNo;
  final double coverHeight = 270;
  final double profileHeight = 144;
  final double top = 200;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerPage(
        uid: uid,
        mobileNo: mobileNo,
      ),
      appBar: AppBar(
        title: Text(
          'About',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          //  alignment: Alignment.center,
          children: [
            buildCoverImage(),
            Positioned(
              top: top,
              child: buildProfileImage(),
            ),
            Center(
                child: Text("Coimbatore City Corporation",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
              child: Marquee(
                text: 'Complaint issues',
                style: TextStyle(fontWeight: FontWeight.bold),
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
            SizedBox(
              height: 15,
            ),
            Text(
              "ABOUT",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Coimbatore also known as Kovai is a major city in the Indian state of Tamil Nadu. "
              "Located on the banks of the Noyyal River surrounded by the Western Ghats, it is the second largest city in the state after Chennai and 16th largest urban agglomeration in India."
              " It is the largest city in the Kongunadu region. "
              "Coimbatore is a municipal corporation administered by the Coimbatore Municipal Corporation and is the administrative headquarters of Coimbatore district."
              "It is administered by the Coimbatore Municipal Corporation and is the administrative capital of Coimbatore district.",
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text('RegisterComplaint'),
              onPressed: () {
                Get.to(streetpage(uid: uid));
                FirebaseAuth.instance.authStateChanges().listen((User? user) {
                  if (user == null) {
                    print('User is currently signed out!');
                  } else {
                    print('User is signed in!');
                    print('login number');
                    print(user.phoneNumber);
                    print(user.uid);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset('assets/cor.png'),
        width: double.infinity,
        height: coverHeight,
      );

  Widget buildProfileImage() => CircleAvatar(
        backgroundImage: AssetImage('assets/images/cbelogo.png'),
        //backgroundImage: NetworkImage(
        //  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FCoimbatore_Municipal_Corporation&psig=AOvVaw2hdlxdk4Cet1XIDxvor3A9&ust=1652526153150000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCMC0juWp3PcCFQAAAAAdAAAAABAD'),
        radius: profileHeight / 3,
        backgroundColor: Colors.grey.shade800,
      );
}
