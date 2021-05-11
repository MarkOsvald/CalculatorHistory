import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator_project/persistance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Previous calculations',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            FutureBuilder<SharedPreferences>(
              future: Persistence.init(),
              builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                List<String> values = snapshot.data.getKeys().map<String>((key) => snapshot.data.get(key)).toList();
                return Column(
                  children: values.map<Widget>((result) => Text(result)).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}