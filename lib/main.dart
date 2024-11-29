import 'package:flutter/material.dart';
import 'package:id_card/view_model/dashboard_provider.dart';
import 'package:id_card/view_model/login_provider.dart';
import 'package:id_card/views/login_screen.dart';
import 'package:id_card/views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> LoginProvider()),
        ChangeNotifierProvider(create: (_)=> DashboardProvider())
      ],
      child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
    );
  }
}
