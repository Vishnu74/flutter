import 'package:auto_size_text/auto_size_text.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Roadspage extends StatefulWidget {
  const Roadspage({Key? key}) : super(key: key);

  @override
  State<Roadspage> createState() => _RoadspageState();
}

class _RoadspageState extends State<Roadspage> {
  List name = [
    'The Coimbatore BRTS was a proposed bus rapid transit system for the Kovai metropolitan area under the JNNURM scheme. Project stretch of about 18.6 km starting at Avinashi Road and ending at Mettupalayam Road running through Dr.Rajendra Prasath Road. After Avinashi road, the project road turns left from Stanes School and passes along Dr.Nanjappa road and joins at Dr. Rajendra Prasad Road (100 Ft. Road). Avinashi road, Dr. Rajendra Prasad Road and Mettupalyam road are provided with the exclusive lane for buses termed BRTS lane and the connecting links are allowed to flow with the mixed traffic,'
        'A Dedicated Two Lane carriageway of width 7.0m is provided for BRTS corridor. A Dual Lane for Mixed Traffic of Width 7.0m is provided on either side of the BRTS corridor. The Mixed traffic lane is separated from the BRTS lane by providing 250mm wide CC block on both sides. 2.0m wide cycle track over and 2.0m wide Footpath over built-up drain is proposed on either side of Mixed Traffic Lane. The Cycle Track is separated from Mixed Traffic Lane by providing 250mm CC Buttons. Out of Total 17.6 km BRTS is passing at grade for a length of 6.64 km (dedicated) and 6.87 km is passing through elevated section. It is proposed to have 14 at grade bus stops and 3 elevated bus stops,'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('BUS ROUTE'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 1800,
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
                      'Coimbatore Bus',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DataTable(columns: [
                      DataColumn(
                        label: Text('BUS NO'),
                      ),
                      DataColumn(
                        label: Text('FROM'),
                      ),
                      DataColumn(
                        label: Text('TO'),
                      ),
                    ], rows: [
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('MARUTHAMALLAI')),
                        DataCell(Text('AVARAMPALAYAM')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('1A')),
                        DataCell(Text('ONDIPUTHUR')),
                        DataCell(Text('VADAVALLI')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('1D,1E')),
                        DataCell(Text('ONDIPUTHUR')),
                        DataCell(Text('MARUTHAMALAI')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('42')),
                        DataCell(Text('SIGNALLUR')),
                        DataCell(Text('GANAPATHY')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('5')),
                        DataCell(Text('SITRA')),
                        DataCell(Text('KURINJINAGAR')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('3c')),
                        DataCell(Text('kuniamuthur')),
                        DataCell(Text('GANDHIPURAM')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('5C')),
                        DataCell(Text('THUDIYALUR')),
                        DataCell(Text('SAIBABACOLONY')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('11')),
                        DataCell(Text('KANUVAI')),
                        DataCell(Text('RAILWAYSTATION')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('96')),
                        DataCell(Text('GANDHIPURAM')),
                        DataCell(Text('VALLAYAR')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('63')),
                        DataCell(Text('MULLAINAGAR')),
                        DataCell(Text('ABARANA')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('63')),
                        DataCell(Text('PODHANUR')),
                        DataCell(Text('MACHAMPALAYAM')),
                      ]),
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
