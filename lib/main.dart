import 'package:api_service/repository/api_service.dart';
import 'package:bloc_single_state_class_example/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final apiService = const ApiService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dubai Bloc Example',
      theme: ThemeData.dark(useMaterial3: true),
      home: BlocProvider(
        create: (context) =>
            HomeBloc(apiService: apiService)..add(const HomeApiCallEvent()),
        child: const HomeView(),
      ),
    );
  }
}
