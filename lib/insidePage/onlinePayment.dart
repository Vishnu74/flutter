import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_live_uA1mkCiTKH8Vc8",
      "amount": num.parse(textEditingController.text) * 100,
      "name": "Sample App",
      "description": "Payment for the some random product",
      "prefill": {"contact": "0000000000", "email": "vishnukrishnan431.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print("Pament success");
    // Toast.show("Pament success", context);
  }

  void handlerErrorFailure() {
    print("Pament error");
    //Toast.show("Pament error", context);
  }

  void handlerExternalWallet() {
    print("External Wallet");
    // Toast.show("External Wallet", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tax Payment"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextFormField(
                //maxLines: 7,
                decoration: InputDecoration(
                    hintText: "Name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                //maxLines: 7,
                decoration: InputDecoration(
                    hintText: "Mobile no:",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Municipal Corporation',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                //maxLines: 7,
                decoration: InputDecoration(
                    hintText: "Area",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                //maxLines: 7,
                decoration: InputDecoration(
                    hintText: "Locality",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                //maxLines: 7,
                decoration: InputDecoration(
                    hintText: "Enter old Assessement no",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                //maxLines: 7,
                decoration: InputDecoration(
                    hintText: "Enter  new assessement no",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                    hintText: "amount to pay", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 12,
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  "PAY",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  openCheckout();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
