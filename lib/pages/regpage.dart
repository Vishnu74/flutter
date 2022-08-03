import 'package:corporateoffice/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/text_field.dart';

class regPage extends StatefulWidget {
  regPage({Key? key}) : super(key: key);

  @override
  State<regPage> createState() => _regPageState();
}

class _regPageState extends State<regPage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phnoController = TextEditingController();

  final TextEditingController _mailidController = TextEditingController();

  final TextEditingController _addresController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  String verificationID = "";
  bool otpVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //image

              // SvgPicture.asset(
              //   'assets/images.svg',
              //   height: 90,
              //   color: Colors.black,
              // ),
              const SizedBox(height: 64),
              //textfield input regno
              TextFieldInput(
                  textEditingController: _nameController,
                  hintText: 'Name:',
                  textInputType: TextInputType.text),
              //textfield input password
              const SizedBox(height: 24),
              TextFieldInput(
                  textEditingController: _phnoController,
                  hintText: 'Phno:',
                  textInputType: TextInputType.text),
              const SizedBox(height: 24),
              TextFieldInput(
                  textEditingController: _addresController,
                  hintText: 'Addres:',
                  textInputType: TextInputType.text),
              const SizedBox(height: 24),
              TextFieldInput(
                  textEditingController: _mailidController,
                  hintText: 'Mailid',
                  textInputType: TextInputType.text),
              const SizedBox(height: 24),
              //button login
              const SizedBox(height: 24),

              Visibility(
                child: TextField(
                  controller: _otpController,
                  decoration: InputDecoration(),
                  keyboardType: TextInputType.number,
                ),
                visible: otpVisibility,
              ),
              InkWell(
                onTap: () {
                  loginWithPhone();
                  // if (otpVisibility) {
                  //   verifyOTP();
                  // } else {
                  //   loginWithPhone();
                  // }
                },
                child: Container(
                  child: const Text('Register',
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

              const SizedBox(height: 12),
              //transation to singin
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Already have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (context) => loginPage()));
                    },
                    child: Text(
                      "login ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: _phnoController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: _otpController.text);

    await auth.signInWithCredential(credential).then((value) {
      print("You are logged in successfully");
      Fluttertoast.showToast(
          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }
}
