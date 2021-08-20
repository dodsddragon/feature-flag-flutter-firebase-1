import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_feature_flag_1/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FlutterFeatureFlagApp());
}

class FlutterFeatureFlagApp extends StatelessWidget {
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: FutureBuilder(
          future: _firebaseApp,
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return Text('Something went wrong!');
            } else if (snapshot.hasData){
              return Dashboard(snapshot.data as FirebaseApp);
            }
            else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}