import 'package:clean_archticture2/TVs/presentation/screens/movie_screen2.dart';
import 'package:clean_archticture2/TVs/presentation/screens/movies_screen.dart';
import 'package:clean_archticture2/core/servises/servises_locator.dart';
import 'package:flutter/material.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900
      ),
      home: const MainMoviesScreen(),
    );
  }
}


