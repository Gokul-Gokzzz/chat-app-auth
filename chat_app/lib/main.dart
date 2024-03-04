import 'package:chat_app/controller/auth_provider.dart';
import 'package:chat_app/controller/firebase_provider.dart';
import 'package:chat_app/controller/basic_provider.dart';
import 'package:chat_app/service/firebase_options.dart';
import 'package:chat_app/view/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BasicProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => FirebaseProvider(),
        )
      ],
      child: const MaterialApp(
        home: AuthGate(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
