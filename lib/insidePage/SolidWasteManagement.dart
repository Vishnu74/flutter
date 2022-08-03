import 'package:auto_size_text/auto_size_text.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SolidWaste extends StatefulWidget {
  const SolidWaste({Key? key}) : super(key: key);

  @override
  State<SolidWaste> createState() => _SolidWasteState();
}

class _SolidWasteState extends State<SolidWaste> {
  List name = [
    'Fully with Manpower',
    'Conservancy Operation 6.30 am to 1.30 p.m.',
    'Night Conservancy between 9.00 pm to 2.00 a.m.',
    'Night Sweeping also done with mechanical Sweeper in Bus Route Roads / Main roads.',
    'Each worker has been assigned with work schedule'
  ];
  List name2 = [
    'Coco Brooms',
    'Baskets (Aluminum)',
    'Brushes',
    'Iron Plate (Penku)',
    'Containerised push carts',
    'Tricycles with Bins',
    'Roto mould wheeled bins'
  ];
  List name3 = [
    'Street collection to disposal site.',
    'Transportation to disposal site from transfer station.',
    'Collecting the Source Separated Waste from the Households by Tricycles or Light Motor Vehicles and bio degradable waste is being sent to decentralized waste processing facilities and dry waste is being collected every Wednesday for recycle purpose and remaining waste to transfer Stations/dump sites'
  ];
  List name4 = [
    'At present Garbage generated in Chennai is dumping at two land fill sites and construction and demolition waste is being used for covering each layer of garbage in two dump sites.',
    'For remediation of the existing Landfill or scientific closure and to have the Integrated waste processing facilities with waste to energy plant as component at the existing Kodungaiyur and Perungudi dump sites, the Transaction Advisory Consultant have prepared DFR and sent for approval of the competent Authority and simultaneously the RFP documents are under preparation.',
    'Number of Disposal Sites : Two (Kodungaiyur and Perungudi)'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('SolidWasteManagement'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 2400,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BulletedList(
                listItems: name,
                listOrder: ListOrder.ordered,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Equipments Used',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              BulletedList(
                listItems: name2,
                listOrder: ListOrder.ordered,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Secondary Collection: (Transportation)',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              BulletedList(
                listItems: name3,
                listOrder: ListOrder.ordered,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Waste Disposal',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              BulletedList(
                listItems: name4,
                listOrder: ListOrder.ordered,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                //maxLines: 7,
                decoration: InputDecoration(
                    hintText: "Name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 7,
                decoration: InputDecoration(
                    hintText: "Queries",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
