import 'package:flutter/material.dart';

class LoadingWidget {
  static Future<void> buildLoading(BuildContext context, String message) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const AlertDialog(
            content: SizedBox(
              height: 60,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }
}
