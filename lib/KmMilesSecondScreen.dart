import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MySecondRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SecondRoute();
}

class SecondRoute extends State<MySecondRoute> {
  final controller_number = TextEditingController();
  final my_form_key = GlobalKey<FormState>();

  String textToShow = "";

  void KmToMiles() {
    if (my_form_key.currentState.validate()) {
      double number = double.parse(controller_number.text);
      double result = number * 1.60934;
      result.toString();
      setState(() {
        textToShow = "$result miles";
      });
    }
  }
  void MilesToKm() {
    if (my_form_key.currentState.validate()) {
      double number = double.parse(controller_number.text);
      double result = number * 0.621371;
      result.toString();
      setState(() {
        textToShow = "$result km";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Km to miles converter"),
      ),
      body: Form(
          key: my_form_key,
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(controller: controller_number,
                  validator: (value) {
                    if (value.isEmpty) return "Please enter number";
                  },
                  decoration: InputDecoration(hintText: "Enter number"),
                  keyboardType: TextInputType.number),
              Text( textToShow,
                style: TextStyle(fontSize: 20.0),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: KmToMiles,
                    child: Text('km/miles'),
                  ),
                  RaisedButton(
                    onPressed: MilesToKm,
                    child: Text('miles/km'),
                  ),
                  RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Back")
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}