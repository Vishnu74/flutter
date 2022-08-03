import 'package:corporateoffice/insidePage/BusPass.dart';
import 'package:corporateoffice/insidePage/EducationPage.dart';
import 'package:corporateoffice/insidePage/HealthPage.dart';
import 'package:corporateoffice/insidePage/RevenuePage.dart';
import 'package:corporateoffice/insidePage/SolidWasteManagement.dart';
import 'package:corporateoffice/insidePage/WaterSupply.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class departmentPage extends StatelessWidget {
  const departmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 93, 123, 1),
      appBar: AppBar(
        title: Text('department'),
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
                    'Health',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Get.to(HealthPage());
                  },
                ),
              ),
              Card(
                color: Colors.white60,
                shadowColor: Colors.black,
                child: ListTile(
                  hoverColor: Colors.green,
                  title: Text(
                    'Revenue',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                  onTap: () {
                    Get.to(RevenuePage());
                  },
                ),
              ),
              Card(
                color: Colors.white60,
                shadowColor: Colors.black,
                child: ListTile(
                  hoverColor: Colors.green,
                  title: Text(
                    'Education',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                  onTap: () {
                    Get.to(EducationPage());
                  },
                ),
              ),
              Card(
                color: Colors.white60,
                shadowColor: Colors.black,
                child: ListTile(
                  hoverColor: Colors.green,
                  title: Text(
                    'Solid waste management',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                  onTap: () {
                    Get.to(SolidWaste());
                  },
                ),
              ),
              Card(
                color: Colors.white60,
                shadowColor: Colors.black,
                child: ListTile(
                  hoverColor: Colors.green,
                  title: Text(
                    'Bus Route',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                  onTap: () {
                    Get.to(Roadspage());
                  },
                ),
              ),
              Card(
                color: Colors.white60,
                shadowColor: Colors.black,
                child: ListTile(
                  hoverColor: Colors.green,
                  title: Text(
                    'Water supply',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                  onTap: () {
                    Get.to(WaterSupply());
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
