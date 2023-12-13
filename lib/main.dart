import 'package:cubic_state_mgmt2_list_of_map/cubic/cubic_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page.dart';


void main() {
  runApp(
    // Single Bloc Provider
    // BlocProvider(
    //   create: (context) => CubicCountereFunc(),
    //   child: MyApp(),
    // ),

    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CountereCubit(),),
        BlocProvider(create: (context) => ListCubit(),),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cubic => List of Map ',


      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}