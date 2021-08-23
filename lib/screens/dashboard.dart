import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feature_flag_1/components/button.dart';
import 'package:flutter_feature_flag_1/screens/contacts/contacts_list.dart';
import 'package:flutter_feature_flag_1/screens/contacts/v2/contacts_list.dart'
    as v2;
import 'package:flutter_feature_flag_1/screens/payments/payments_list.dart';

const _titleAppBar = 'Feature Flag Realtime Db';

class Dashboard extends StatefulWidget {
  final FirebaseApp app;

  Dashboard(this.app);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> features = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_titleAppBar),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
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
                features.contains('contactsV2')
                    ? Button('Contacts V2', Icons.people_alt_outlined,
                        onTap: () =>
                            _navigateToWidget(context, v2.ContactsList()))
                    : Button('Contacts', Icons.people,
                        onTap: () =>
                            _navigateToWidget(context, ContactsList())),
                Button('Payments', Icons.monetization_on_outlined,
                    onTap: () => _navigateToWidget(context, PaymentsList()))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    debugPrint('initState');
    _fetchFeatureFlag();
  }

  void _fetchFeatureFlag() {
    final DatabaseReference db = FirebaseDatabase(app: widget.app).reference();
    db.child('features').once().then((result) {
      final List<Object?> values = result.value;
      values.forEach((val) => features.add(val.toString()));
      setState(() {
        features = features;
      });
    });
  }

  void _navigateToWidget(BuildContext context, Widget routeWidget) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => routeWidget));
  }
}
