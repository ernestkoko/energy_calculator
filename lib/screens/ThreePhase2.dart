import 'package:flutter/material.dart';

class ThreePhase extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ThreePhaseState();
  }
}

class _ThreePhaseState extends State<ThreePhase> {
  String s;

  //controller for the text fields
  TextEditingController _v1Controller = TextEditingController();
  TextEditingController _v2Controller = TextEditingController();
  TextEditingController _v3Controller = TextEditingController();
  TextEditingController _i1Controller = TextEditingController();
  TextEditingController _i2Controller = TextEditingController();
  TextEditingController _i3Controller = TextEditingController();
  TextEditingController _pfController = TextEditingController();
  TextEditingController _availabilityController = TextEditingController();
  TextEditingController _tariffController = TextEditingController();
  TextEditingController _monthController = TextEditingController();

  //values for our parameters
  double _v1, _v2, _v3, _i1, _i2, _i3, _pf, _avail, _months, _tariff;

  //returns true if all fields are numbers else false
  bool hasLetter;

  //text Scale Factor
  double textScaleFactor = 1.5;

  //text style
  TextStyle textStyle = TextStyle(
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w700,
  );

  //dispose off the controllers when done
  @override
  void dispose() {
    _i1Controller.dispose();
    _i2Controller.dispose();
    _i3Controller.dispose();
    _v1Controller.dispose();
    _v2Controller.dispose();
    _v3Controller.dispose();
    _pfController.dispose();
    _availabilityController.dispose();
    _monthController.dispose();
    _tariffController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //when the page is opening all fields are null
//    _tariffController.text = 2.toString();
//    _monthController.text = 2.toString();
//    _availabilityController.text = 2.toString();
//    _pfController.text = 2.toString();
//    _i1Controller.text = 2.toString();
//    _i2Controller.text = 2.toString();
//    _i3Controller.text = 2.toString();
//    _v1Controller.text = 2.toString();
//    _v2Controller.text = 2.toString();
//    _v3Controller.text= 2.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text("Three Phase"),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _v1Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Voltage1:",
                        helperStyle: TextStyle(color: Colors.black),
                        helperText: "Volts",
                        hintText: "e.g 230"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _v2Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Voltage2:",
                        helperText: "Volts",
                        hintText: "e.g 230"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _v3Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Voltage3:",
                        helperText: "Volts",
                        hintText: "e.g 230"),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _i1Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Current1:",
                        helperText: "Amperes",
                        hintText: "e.g 12.3"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _i2Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        helperText: "Amperes",
                        labelText: "Current2:",
                        hintText: "e.g 12.3"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _i3Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Current3:",
                        helperText: "Amperes",
                        hintText: "e.g 12.3"),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _pfController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Power Factor:",
                        helperText: "PF",
                        hintText: "e.g 0.85"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _tariffController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        helperText: "Naira",
                        labelText: "Tariff:",
                        hintText: "e.g 12.3"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _availabilityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Availability:",
                        helperText: "Hours",
                        hintText: "e.g 200"),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _monthController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Months:",
                        helperText: "Number",
                        hintText: "e.g 2"),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Power(KW): " + _power().toStringAsFixed(2),
                  textScaleFactor: textScaleFactor,
                  style: textStyle,
                ),
                Text(
                  "Energy(KWH): " + _energy().toStringAsFixed(2),
                  textScaleFactor: textScaleFactor,
                  style: textStyle,
                ),
                Text(
                  "Amount(#): " + _amount().toStringAsFixed(2),
                  textScaleFactor: textScaleFactor,
                  style: textStyle,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text("Reset"),
                    onPressed: () {
                      setState(() {
                        _resect();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text("Calculate"),
                    onPressed: () {
                      _amount();
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  //calculate the power in KW
  double _power() {
    double result;
    double avCurrent;
    double avVoltage;

    //check the state

    //check if it is number
    checkIfNumber();

    //for power we need current, voltage, power factor,pf
    if (!hasLetter) {
      setState(() {
//        if (_i1Controller.text.contains(new RegExp(r'[0-9]+\.')) ||
//            _i2Controller.text.contains(new RegExp(r'[0-9]+\.')) ||
//            _i3Controller.text.contains(new RegExp(r'[0-9]+\.')) ||
//            _v1Controller.text.contains(new RegExp(r'[0-9]+\.')) ||
//            _v2Controller.text.contains(new RegExp(r'[0-9]+\.')) ||
//            _v3Controller.text.contains(new RegExp(r'[0-9]+\.'))) {
          _i1 = double.tryParse(_i1Controller.text);
          _i2 = double.tryParse(_i2Controller.text);
          _i3 = double.tryParse(_i3Controller.text);
          _v1 = double.tryParse(_v1Controller.text);
          _v2 = double.tryParse(_v2Controller.text);
          _v3 = double.tryParse(_v3Controller.text);
          _pf = double.tryParse(_pfController.text);
//        } else {
//          _v1 = 0;
//          _v2 = 0;
//          _v3 = 0;
//          _i1 = 0;
//          _i2 = 0;
//          _i3 = 0;
//          _pf = 0;
//        }
      });
    } else {
      _v1 = 0;
          _v2 = 0;
          _v3 = 0;
          _i1 = 0;
          _i2 = 0;
          _i3 = 0;
          _pf = 0;
      //  }
    }
    // taking the absolute values and finding the average
    avCurrent = (_i1 + _i2 + _i3) / 3;
    avVoltage = (_v1 + _v2 + _v3) / 3;
    // three phase power calculation
    result = (avCurrent * avVoltage * _pf * 3) / 1000;

    return result;
  }

  //calculate the energy
  double _energy() {
    double result;
    //get the result from _power()
    double power = _power();
    if (hasLetter) {
      setState(() {
        if (_availabilityController.text.contains(new RegExp(r'[0-9]+\.')) ||
            _monthController.text.contains(new RegExp(r'[0-9]+\.'))) {
          _avail = double.tryParse(_availabilityController.text);
          _months = double.tryParse(_monthController.text);
        } else {
          _avail = 0;
          _months = 0;
        }
      });
    } else {
//
      _avail = double.tryParse(_availabilityController.text);
      _months = double.tryParse(_monthController.text);
    }
    //calculate for energy
    result = power * _avail * _months;
    return result;
  }

  //calculate the amount
  double _amount() {
    double result;
    //get the value of the energy
    double energy = _energy();
    if (hasLetter) {
      setState(() {
        _tariff = 0;
        if (_tariffController.text.contains(new RegExp(r'[0-9]+\.'))) {
          _tariff = double.tryParse(_tariffController.text);
        } else {
          _tariff = 0;
        }
      });
    } else {
//      if(_tariffController.text.contains(new RegExp(r'[^0-9]'))){
//        _tariff =0;
//      }else {
      _tariff = double.tryParse(_tariffController.text);
      //  }
    }
    // calculate the amount
    //tariff in nigeria is 7.5% as at the time of this documentation
    result = _tariff * energy * 1.075;

    return result;
  }

  void _resect() {
    _v1Controller.text = "";
    _v2Controller.text = "";
    _v3Controller.text = "";
    _i1Controller.text = "";
    _i2Controller.text = "";
    _i3Controller.text = "";
    _pfController.text = "";
    _availabilityController.text = "";
    _monthController.text = "";
    _tariffController.text = "";
  }

  //checking if users type in values that are not numbers e.g letters and (: etc
  void checkIfNumber() {
    _v3Controller.text;

    RegExp regExp = RegExp("([0-9])");
    RegExp regExp2 = RegExp("([a-z])");
    Pattern pattern = regExp;
    if (_v1Controller.text.contains(
          regExp,
        ) &&
        _v2Controller.text.contains(regExp) &&
        _v3Controller.text.contains(regExp) &&
        _i1Controller.text.contains(regExp) &&
        _i2Controller.text.contains(regExp) &&
        _i3Controller.text.contains(regExp) &&
        _pfController.text.contains(regExp) &&
        _availabilityController.text.contains(regExp) &&
        _monthController.text.contains(regExp) &&
        _tariffController.text.contains(regExp)) {
      setState(() {
        hasLetter = false;
      });
    } else if (_v1Controller.text == "" &&
        _v2Controller.text == " "&&
        _v3Controller.text== " " &&
        _i1Controller.text== " " &&
        _i2Controller.text== " " &&
        _i3Controller.text== " " &&
        _pfController.text== " " &&
        _availabilityController.text== "" &&
        _monthController.text== " " &&
        _tariffController.text== " ") {
      setState(() {
        hasLetter = true;
      });
    } else if((_v1Controller.text.contains(
      regExp2,
    ) &&
        _v2Controller.text.contains(regExp2) &&
        _v3Controller.text.contains(regExp2) &&
        _i1Controller.text.contains(regExp2) &&
        _i2Controller.text.contains(regExp2) &&
        _i3Controller.text.contains(regExp2) &&
        _pfController.text.contains(regExp2) &&
        _availabilityController.text.contains(regExp2) &&
        _monthController.text.contains(regExp2) &&
        _tariffController.text.contains(regExp2))){
     setState(() {
       hasLetter = true;
     });

    }else{
     setState(() {
       hasLetter = true;
     });
    }
  }
}
