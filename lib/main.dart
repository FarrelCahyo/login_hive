import 'package:flutter/material.dart';
import 'package:login_hive/account.dart';
import 'package:login_hive/login_screen.dart';
import 'package:login_hive/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

String boxName = 'ACCOUNTBOX';
void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter<Account>(AccountAdapter());
  await Hive.openBox<Account>(boxName);
  runApp(const MyApp());
}

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

