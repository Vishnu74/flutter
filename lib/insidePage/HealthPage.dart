import 'package:auto_size_text/auto_size_text.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({Key? key}) : super(key: key);
  final double coverHeight = 270;
  final double profileHeight = 144;
  double get top => 200;

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  List name = [
    'This corporation is running 20 urban health posts. Through these 20 centers the following services are rendered to the Public, free of cost. From April 2015 onwards 3 New UHPs are opened and functioning at Gandhi maa nagar,Neelikonampalayam, and Vilankurichi.',
    'Antenatal care on all tuesdays.',
    'Delivery facilities round the clock.',
    'Delivery facilities round the clock.',
    'Family welfare clinics on all days.',
    'Distribution of FST tablets for adolescent girls from 11 to 19 yrs of age on all thursdays',
    'IUD insertion and distribution of Oral pills and conventional contraceptive in all the Urban Health Posts.',
    'Sterilization Operation (Tubectomy) (CTM Home, M M Home, S L M Home, V V M Home , R K Bai, Singanallur UHP) In addition laproscopic sterilization and Vasectomy camp is carried out through special camps.',
    'Sterilization Operation (Tubectomy) (CTM Home, M M Home, S L M Home, V V M Home , R K Bai, Singanallur UHP) In addition laproscopic sterilization and Vasectomy camp is carried out through special camps.'
  ];
  List name1 = [
    'There are 5 AIDS Control centres established in this corporation through Tamil Nadu State AIDS Control Society, (TANSACS) Chennai. In these centres blood tests for HIV and counselling are carried out for the patients attending the clinics.',
    'Woman Medical Officer',
    'Public Health Nurse / Maternal Child Health Officer/Sector Health Nurse',
    'Urban Health Nurse',
    'Maternity Ayah',
    SizedBox(
      height: 30,
    ),
  ];
  List name4 = [
    'Treatment of minor ailments, Diagnosis of major illness and referral to Government Hospitals if necessary,'
        'Treatment of fever cases and other infectious diseases like TB and Malaria,'
        'Diagnosis and management of Communicable and Non Communicable diseases,'
        'Basic laboratory Services,'
        'Follow up by Field level health care workers,'
        'Comprehensive health record(Family health cards,'
        'Antenatal Registration and provision of Antenatal and postnatal care,'
        'Immunization for Under five children and growth monitoring,'
        'Motivation of Unprotected Couples for permanent method,'
        'Provision of Contraceptive methods for Unprotected Couples,'
        'Cervical and Breast screening for Cancer,'
        'Counseling service for HIV outreach slum activities,'
        'IEC activities,'
  ];
  List name5 = [
    'Treatment of minor ailments,'
        'Provision of minor surgical services,'
        'Diagnosis of major illness and referral to higher institution if necessary,'
        'Provision of Antenatal care,'
        'Conduction of Delivery – Normal & Caesarian (24x7),'
        'Identification of High risk pregnancy / Delivery'
        'Timely referral to tertiary care centre for safe confinement'
        'Promotion of Exclusive Breast feeding'
        'Provision of Normal New born care'
        'Provision of Sick new born care through NBSU'
        'Immunization for Under five children'
        'Provision of Nutritious diet for delivered and sterilized mothers'
        'Provision of Baby gift set'
        'Growth monitoring'
        'Identification of Developmental delay and referral'
        'Provision of Permanent Family Welfare procedures'
        'Provision of Temporary Contraceptive methods for Unprotected Couples'
        'Cervical and Breast screening for Cancer'
        'Treatment for other Gynaecological minor ailments'
        'Processing of Sterilization Failure case for compensation'
        'Conduction of periodic review at all level'
        'Scheme – JSY for the delivered mothers'
        'Provision of JSSK for transporting the Newborn & Delivered mothers,'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Health'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 3400,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BulletedList(
                listItems: name,
                listOrder: ListOrder.ordered,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'ICTC',
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              BulletedList(
                listItems: name1,
                listOrder: ListOrder.ordered,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Services rendered in the Urban Primary Health Centres',
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              BulletedList(
                listItems: name4,
                listOrder: ListOrder.ordered,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Medical Services in Urban Community Health Centres',
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              BulletedList(
                listItems: name5,
                listOrder: ListOrder.ordered,
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "NAME",
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
              ElevatedButton(onPressed: () {}, child: Text('submit'))
            ],
          ),
        ),
      ),
    );
  }
}
