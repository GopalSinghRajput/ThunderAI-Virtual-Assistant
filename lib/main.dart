import 'package:flutter/material.dart';
import 'home_page.dart';
import 'pallete.dart';
// import 'package:gopal/navbar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ThunderAI',
      theme: ThemeData.light(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: Pallete.backbar, 
          appBarTheme: const AppBarTheme(backgroundColor: Pallete.fullblack)),
      home: const HomePage(),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override 
  Widget build(BuildContext context) {
    return const Drawer();
  }
}
