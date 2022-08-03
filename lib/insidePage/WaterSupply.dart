import 'package:auto_size_text/auto_size_text.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaterSupply extends StatefulWidget {
  const WaterSupply({Key? key}) : super(key: key);

  @override
  State<WaterSupply> createState() => _WaterSupplyState();
}

class _WaterSupplyState extends State<WaterSupply> {
  List name = [
    'This department is headed by the City Engineer to assist the Commissioner. There are two Executive Engineers, E.E (west) for west and south zones and E.E (east) for east and north zones. There is one Assistant Executive Engineer for each of the four zones and a Junior / Assistant Engineer for every two divisions.',
    'There are two major sources of supply of drinking water to Coimbatore City: Siruvani and Pilloor schemes. The corporation is maintaining the distribution of water supply. The entire supply of water from Siruvani is by nature of gravity whereas pumping is being done in the Pilloor scheme. A separate scheme to augment the Pilloor water supply scheme to the Coimbatore Corporation has been sanctioned under JNNURM and the works are in various stages of progress.',
    'The Corporation provides a number of services to the residents of the City. The following services are rendered by the CCMC under water supply,'
  ];

  List name1 = [
    'New Water supply connection',
    'Request for Water supply Lorry',
    'Request for Type Transfer of Water supply Connection',
    'Request for Name Transfer of Water supply Connection'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('WaterSupply'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 1400,
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
                      'AboutDepartment',
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BulletedList(
                      listItems: name1,
                      listOrder: ListOrder.ordered,
                      style: TextStyle(fontSize: 18),
                    ),
                    DataTable(columns: [
                      DataColumn(
                        label: Text('id'),
                      ),
                      DataColumn(
                        label: Text('street'),
                      ),
                      DataColumn(
                        label: Text('ward'),
                      ),
                      DataColumn(
                        label: Text('Timing'),
                      ),
                      DataColumn(
                        label: Text('date'),
                      ),
                    ], rows: [
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('ukkadam')),
                        DataCell(Text('132')),
                        DataCell(Text('9.30')),
                        DataCell(Text('15 june2022')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('2')),
                        DataCell(Text('Townhall')),
                        DataCell(Text('142')),
                        DataCell(Text('10.00')),
                        DataCell(Text('16 JUne 2022')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('3')),
                        DataCell(Text('Railway Station')),
                        DataCell(Text('143')),
                        DataCell(Text('2.00')),
                        DataCell(Text('17 junne 2022')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('4')),
                        DataCell(Text('Collector Office')),
                        DataCell(Text('144')),
                        DataCell(Text('3.00')),
                        DataCell(Text('19 june 22')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('5')),
                        DataCell(Text('VOC Park')),
                        DataCell(Text('145')),
                        DataCell(Text('4.00')),
                        DataCell(Text('22 june 2022')),
                      ])
                    ])
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
