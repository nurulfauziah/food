import 'package:first_app/provider/counter_provider.dart';
import 'package:first_app/provider/movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:first_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CounterProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => MoviesProvider(),
          ),
        ],
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: HomeScreen(title: 'Flutter Demo Home Page'),
          );
        });
  }
}
