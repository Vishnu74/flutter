import 'package:auto_size_text/auto_size_text.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RevenuePage extends StatefulWidget {
  const RevenuePage({Key? key}) : super(key: key);

  @override
  State<RevenuePage> createState() => _RevenuePageState();
}

class _RevenuePageState extends State<RevenuePage> {
  List revenue = [
    'The Corporation is divided in to Five Zones.  Each Zone is headed by Assistant Commissioner and assisted by Assistant Revenue Officer, Special Revenue Inspector,  Bill Collectors  and  Junior Assistants.',
    'In the Main Office, The  Commissioner, Deputy Commissioner and Assistant Commissioner (Revenue)  are  monitoring the entire Revenue process.',
    'The following Taxes & Non-Tax  assessment and collection works are being carried  out  under Revenue Section.',
    '  Property Tax  Assessment',
    ' Vacant  Land Tax Assessment',
    'Profession Tax  Assessment',
    'Non –tax Assessment'
  ];
  List name2 = [
    ' Prescribed application form with applicants’ passport size photo.',
    'Document  copy  & Parent Document.',
    'Building Plan Approval Order copy & Plan copy.',
    'Adhar Copy of the applicant.',
    'Up-to-date   EC copy.',
    'Rain Water Harvest photo with the applicant.',
    'Vacant Land Tax paid receipt.',
    'Up-to-date  Property Tax & Water charges receipt in case of additional construction.',
    'Rs.40/- stamped self addressed cover. '
  ];
  List name3 = [
    'VLT levied for the period of 13 half years including the current half yearly, and it will be continued every half year (Apr.& Oct.) upto the period of building construction.',
    ' Prescribed application form with applicants’ passport size photo.',
    '  Document copy & Parent Document copy',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Revenue'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1400,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BulletedList(
                listItems: revenue,
                listOrder: ListOrder.ordered,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Property Tax',
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),
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
                'Vacant land Assesement',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              BulletedList(
                listItems: name3,
                listOrder: ListOrder.ordered,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
