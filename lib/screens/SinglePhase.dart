import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SinglePhase extends StatefulWidget {
  SinglePhase();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SinglePhaseState();
  }
}

class _SinglePhaseState extends State<SinglePhase> {
  TextEditingController _voltageController = TextEditingController();
  TextEditingController _currentController = TextEditingController();
  TextEditingController _pfController = TextEditingController();
  TextEditingController _availabilityController = TextEditingController();
  TextEditingController _tariffController = TextEditingController();
  TextEditingController _monthsController = TextEditingController();

  bool hasLetter;
  double _current;
  double _voltage;
  double _tarrif;
  double _numberOfMonths;
  double _availability;
  double _pf;

  double power;
  double energy;
  double amount;

  //initialise

  @override
  Widget build(BuildContext context) {

    if(_voltageController.text == "" ||
    _currentController.text == "" ||
    _pfController.text == "" ||
    _availabilityController.text == "" ||
    _tariffController.text == "" ||
    _monthsController.text ==""
    ){
      setState(() {
        power =0;
        energy =0;
        amount =0;

      });


    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Phase"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _voltageController,
                      style: Theme.of(context).textTheme.title,
                      keyboardType: TextInputType.number,
                      maxLines: 2,

                      decoration: InputDecoration(
                        labelStyle: Theme.of(context).textTheme.title,
                        hintText: "e.g 240",
                        helperText: "Volts",
                        labelText: "Voltage:",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _currentController,
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.title,
                      maxLines: 2,
                      decoration: InputDecoration(
                          labelText: "Current:",
                          helperText: "Amperes",
                          hintText: "e.g 12.4",
                          labelStyle: Theme.of(context).textTheme.title,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          fillColor: Colors.deepPurple),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 3.0,
            color: Colors.white70,
            margin: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _availabilityController,
                      style: Theme.of(context).textTheme.title,
                      keyboardType: TextInputType.number,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: "Availability",
                        helperText: "Hours",
                        labelText: "Availability:",
                        labelStyle: Theme.of(context).textTheme.title,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                        )
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _pfController,
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.title,
                      maxLines: 2,
                      decoration: InputDecoration(
                          labelText: "pf:",
                          helperText: "Factor",
                          hintText: "e.g 0.85",
                          labelStyle: Theme.of(context).textTheme.title,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          fillColor: Colors.deepPurple),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _tariffController,
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.title,
                      maxLines: 2,
                      decoration: InputDecoration(
                          labelText: "Tariff:",
                          helperText: "Naira",
                          hintText: "e.g 30.23",
                          labelStyle: Theme.of(context).textTheme.title,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          fillColor: Colors.deepPurple),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _monthsController,
                      maxLines: 2,
                      decoration: InputDecoration(
                          labelText: "Months:",
                          helperText: "Number",
                          hintText: "e.g 3",
                      labelStyle: Theme.of(context).textTheme.title,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      )),
                      
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      setState(() {
                        _resetFields();
                      });
                    },
                    elevation: 1.0,
                    child: Text(
                      "Reset",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    elevation: 2.0,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    textTheme: ButtonTextTheme.primary,
                    child: Text("Submit"),
                    onPressed: () {
                      setState(() {
                        _power();
//                        _availabilityController.text;
//                        _pfController.text;
//                        _voltageController.text;
//                        _currentController.text;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 15.0, left: 8.0, right: 8.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // textBaseline: TextBaseline.ideographic,

              children: <Widget>[
                Text(
                  "Power(KW): " + power.toStringAsFixed(2),
                  textScaleFactor: 1.5,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  "Energy(KWH): " + energy.toStringAsFixed(2),
                  textScaleFactor: 1.5,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  "Amount(#): " + amount.toStringAsFixed(2),
                  textScaleFactor: 1.5,
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _availabilityController.dispose();
    _currentController.dispose();
    _pfController.dispose();
    _voltageController.dispose();
    _monthsController.dispose();
    _tariffController.dispose();
    super.dispose();
  }

  double _power() {
    // checkIfNumber();

    try {
      _current = double.tryParse(_currentController.text).abs();
      _voltage = double.tryParse(_voltageController.text).abs();
      _pf = double.tryParse(_pfController.text).abs();
      _availability = double.tryParse(_availabilityController.text).abs();
      _numberOfMonths = double.tryParse(_monthsController.text).abs();
      _tarrif = double.tryParse(_tariffController.text).abs();
    } on Exception {
      _current = 0;
      _voltage = 0;
      _pf = 0;
      _availability = 0;
      _numberOfMonths = 0;
      _tarrif =0;
    } finally {
      setState(() {
        power = _current * _voltage * _pf / 1000;
        energy = power * _availability * _numberOfMonths;
        amount = energy * _tarrif * 1.075;
      });
    }
  }

//    if (hasLetter) {
//      _current = 0;
//      _voltage = 0;
//      _pf = 0;
//    } else {
//      if (_currentController.text == "" ||
//          _currentController == null ||
//          _currentController.text == ".") {
//        _current = 0;
//      } else {
//        _current = double.tryParse(_currentController.text);
//      }
//
//      if (_voltageController.text == "" ||
//          _voltageController == null ||
//          _voltageController.text == ".") {
//        _voltage = 0.00;
//      } else {
//        _voltage = double.tryParse(_voltageController.text);
//      }
//
//      if (_pfController.text == "" ||
//          _pfController == null ||
//          _pfController.text == ".") {
//        _pf = 0.00;
//      } else {
//        _pf = double.parse(_pfController.text);
//      }
//    }
//    double result = (_current) * (_voltage) * (_pf) / 1000;
//    return result;
//  }

//  double _energy() {
//    // checkIfNumber();
//
//    double power;
//
//    if (hasLetter) {
//      power = 0;
//      _availability = 0;
//      _numberOfMonths = 0;
//    } else {
//      power = _power();
//
//      if (_availabilityController.text == "" ||
//          _availabilityController == null ||
//          _availabilityController.text == "." ||
//          _monthsController.text == "" ||
//          _monthsController.text == null ||
//          _monthsController.text == ".") {
//
//        _numberOfMonths = 0;
//        _availability = 0;
//      } else {
//        _availability = double.parse(_availabilityController.text);
//        _numberOfMonths = double.tryParse(_monthsController.text);
//      }
//    }
//    double result = power * _availability * _numberOfMonths;
//    return result;
//  }

//  double _amount() {
//    // checkIfNumber();
//    double energy = _energy();
//    if (hasLetter) {
//    } else {
//      if (_tariffController.text == "" || _tariffController.text == null) {
//        _tarrif = 0.00;
//      } else {
//        _tarrif = double.tryParse(_tariffController.text);
//      }
//    }
//    double result = energy * _tarrif * 1.075;
//
//    return result;
//  }

  void _resetFields() {
    setState(() {
      _tariffController.text = "";
      _voltageController.text = "";
      _currentController.text = "";
      _availabilityController.text = "";
      _pfController.text = "";
      _monthsController.text = "";
    });
  }

//  bool checkIfNumber() {
//    if (_pfController.text.contains(new RegExp(
//            r'[^0123456789.-0-1-2-3-4-5-6-7-8-9]',
//            caseSensitive: false)) ||
//        _availabilityController.text.contains(new RegExp(
//            r'[^0123456789.-0-1-2-3-4-5-6-7-8-9]',
//            caseSensitive: false)) ||
//        _voltageController.text.contains(new RegExp(
//            r'[^0123456789.-0-1-2-3-4-5-6-7-8-9]',
//            caseSensitive: false)) ||
//        _currentController.text.contains(new RegExp(
//            r'[^0123456789.-0-1-2-3-4-5-6-7-8-9]',
//            caseSensitive: false)) ||
//        _tariffController.text.contains(new RegExp(
//            r'[^0123456789.-0-1-2-3-4-5-6-7-8-9]',
//            caseSensitive: false)) ||
//        _monthsController.text.contains(new RegExp(
//            r'[^0123456789.-1-2-3-4-5-6-7-8-9-0]',
//            caseSensitive: false))) {
//      setState(() {
//        hasLetter = true;
//      });
//    } else {
//      setState(() {
//        hasLetter = false;
//      });
//    }
//  }
}

//class SinglePhaseResult extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold();
//  }
//}
