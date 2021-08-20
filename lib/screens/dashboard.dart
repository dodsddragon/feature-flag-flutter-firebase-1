import 'package:flutter_feature_flag_1/components/button.dart';
import 'package:flutter_feature_flag_1/screens/contacts/contacts_list.dart';
import 'package:flutter_feature_flag_1/screens/contacts/v2/contacts_list.dart'
    as v2;
import 'package:flutter_feature_flag_1/screens/payments/payments_list.dart';
import 'package:flutter/material.dart';

const _titleAppBar = 'Feature Flag With Firebase Remote Config';

class Dashboard extends StatelessWidget {
  final bool contactFlag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                contactFlag
                    ? Button('Contacts V2', Icons.people_alt_outlined, v2.ContactsList())
                    : Button('Contacts', Icons.people, ContactsList()),
                Button('Payments', Icons.monetization_on_outlined, PaymentsList())
              ],
            ),
          )
        ],
      ),
    );
  }
}

/*
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final bool contactFlag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                Button('Payments', Icons.monetization_on,
                    PaymentsList()),
                contactFlag
                    ? Button('Contacts V2', Icons.nature_people_outlined,
                        v2.ContactsList())
                    : Button('Contacts V1', Icons.people, ContactsList())
              ],
            ),
          )
        ],
      ),
    );
  }
}
*/
