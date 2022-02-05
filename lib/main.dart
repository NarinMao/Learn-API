import 'package:api/post_bloc/post_bloc.dart';
import 'package:api/screen/create_post_page.dart';
import 'package:api/screen/fetch_data_without_bloc.dart';
import 'package:api/screen/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc()..add(GetPostEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: const HomeView(),
      ),
    );
  }
}
