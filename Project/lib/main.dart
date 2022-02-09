// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opulence/screens/SpashScreen.dart';
import 'package:opulence/screens/welcomeScreen.dart';
import 'package:provider/provider.dart';

import 'widgets/loginpage.dart';
import 'widgets/createnew.dart';
import './provider/transactionProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: Opulence(),
    ),
  );
}

class Opulence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


