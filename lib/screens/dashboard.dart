
import 'package:flutter_feature_flag_1/components/button.dart';
import 'package:flutter_feature_flag_1/screens/contacts/contacts_list.dart';
import 'package:flutter_feature_flag_1/screens/contacts/v2/contacts_list.dart' as v2;
import 'package:flutter_feature_flag_1/screens/payments/payments_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final bool contactFlag = true;
  final bool paymentFlag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
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
                    ? Botao('Contacts V2', Icons.nature_people_outlined, v2.ContactsList())
                    : Botao('Contacts V1', Icons.people, ContactsList()),
                paymentFlag
                    ? Botao('Payments V2', Icons.monetization_on, PaymentsList())
                    : Botao('Payments V1', Icons.money, PaymentsList()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
