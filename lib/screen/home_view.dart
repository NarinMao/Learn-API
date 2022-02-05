import 'package:api/screen/fect_data_with_bloc.dart';
import 'package:api/screen/fetch_data_without_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HomePage',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              color: Colors.cyanAccent,
              child: const Text('Fetch Data Without Bloc'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const FectDataWithoutBloc()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton(
              color: Colors.cyanAccent,
              child: const Text(
                'Fetch Data With Bloc',
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const FectDataWithBlocl()));
              },
            )
          ],
        ),
      ),
    );
  }
}
