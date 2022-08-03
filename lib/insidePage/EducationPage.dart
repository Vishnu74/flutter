import 'package:auto_size_text/auto_size_text.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  List name = [
    'The Coimbatore Corporation is managing 82 Schools',
    'Higher Secondary Schools - 16',
    ' High Schools - 10',
    'Middle Schools - 15',
    ' Elementary Schools - 40',
    'Special school for differently abled - 1',
    '12581 Boys 16264 Girls are studying in this Corporation schools.',
    ' 865 teachers and 104 Non-teaching staffs are working in these schools.'
  ];
  List name2 = [
    'Water Purifiers were installed in all Corporation Schools at one machine per 250 students to supply safe and pure drinking water to students.',
    'Multimedia Computers have been supplied to 29 Schools. The Multimedia machines are supported with 1KVA UPS.',
    '190 Computers and required Number of UPS were purchased and supplied to 16 Higher Secondary Schools and 9 High Schools.',
    'Napkin Vending machines and incinerators were purchased and installed in 20 Corporation High and Higher Secondary Schools.'
  ];
  List name3 = [
    'A pair of canvas shoes and two pairs of socks have been given to 9,628 students of standard I to V Studying in Corporation Elementary and Middle Schools.',
    'To inculcate the habit of reading, "The Hindu" news paper have been issued to all the 26 Corporation High and Higher Secondary Schools for students use under the students subscription scheme. Each school will be supplied with 25 copies on school working days from November',
    'During this academic year 2010-2011, 3396 students of this Corporation Higher Secondary and High Schools are writing S.S.L.C.Public Examinations in the month of March / April 2011 and 2404 Students ofthis Corporation Higher Secondary Schools are writing their Higher Secondary Public Examinations in the month of March - 2011. In order to provide them a peaceful atmosphere for their studies and to coach them for their exams evening classes are conducted in all High and Higher Secondary schools. The students who are poor in their studies are attending theabove evening coaching classes. Since most of the students are coming from economically backward families evening Tiffin is provided to them with the help of sponsors.',
    'To promote reading habitof Corporation School students 2440 books were purchased and distributed to the libraries of 16 Higher Secondary Schools and 10 High Schools.'
        'Students Identity cards have been given to all the students studying in this Corporation Schools .'
  ];
  List name4 = [
    'World Classical Tamil Conference 2010 held in Coimbatore between 23.06.2010 and 27.06.2010.',
    'On the last day of the Conference 100 students sang the Thamil Thai Vazhthu and National anthem, Bharathanattiyam dance programme was given by 32 students, The above students were provided Dresses/ Costumes by the Corporation.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Education'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 2800,
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
                'Infra Structural Facilities',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                'Other welfare activities',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                'World Classical Tamil Conference',
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
