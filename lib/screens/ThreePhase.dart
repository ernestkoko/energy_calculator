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

  double power;
  double energy;
  double amount;

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
    if (_v1Controller.text == "" ||
        _v2Controller.text == ""||
        _v3Controller.text== "" ||
        _i1Controller.text== "" ||
        _i2Controller.text== "" ||
        _i3Controller.text== "" ||
        _pfController.text== "" ||
        _availabilityController.text== "" ||
        _monthController.text== "" ||
        _tariffController.text== "") {
      setState(() {

        power=0;
        energy =0;
        amount =0;
//        _tariffController.text = 0.toString();
//        _monthController.text = 0.toString();
//        _availabilityController.text = 0.toString();
//        _pfController.text = 0.toString();
//        _i1Controller.text = 0.toString();
//        _i2Controller.text = 0.toString();
//        _i3Controller.text = 0.toString();
//        _v1Controller.text = 0.toString();
//        _v2Controller.text = 0.toString();
//        _v3Controller.text= 0.toString();
//        hasLetter = true;
      });


    }


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
                  "Power(KW): " + power.toStringAsFixed(2),
                  textScaleFactor: textScaleFactor,
                  style: textStyle,
                ),
                Text(
                  "Energy(KWH): " + energy.toStringAsFixed(2),
                  textScaleFactor: textScaleFactor,
                  style: textStyle,
                ),
                Text(
                  "Amount(#): " + amount.toStringAsFixed(2),
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
                      _power();
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


    try {
      // RegExp regExp = RegExp(r"^\d+((\.+)|(\d+))(\d)$", caseSensitive: false);
      _i1 = double.tryParse(_i1Controller.text).abs();
      _i2 = double.tryParse(_i2Controller.text).abs();
      _i3 = double.tryParse(_i3Controller.text).abs();
      _v1 = double.tryParse(_v1Controller.text).abs();
      _v2 = double.tryParse(_v2Controller.text).abs();
      _v3 = double.tryParse(_v3Controller.text).abs();
      _pf = double.tryParse(_pfController.text).abs();
      _avail = double.tryParse(_availabilityController.text).abs();
      _months = double.tryParse(_monthController.text).abs();
      _tariff = double.tryParse(_tariffController.text).abs();
    } catch (e) {
      _v1 = 0;
      _v2 = 0;
      _v3 = 0;
      _i1 = 0;
      _i2 = 0;
      _i3 = 0;
      _pf = 0;
      _tariff = 0;
      _avail = 0;
      _months = 0;
    } finally {
      double Iav = (_i1 + _i2 + _i3) / 3;
      double Vav = (_v1 + _v2 + _v3) / 3;
      setState(() {
        power = 3 * Iav * Vav * _pf / 100;
        energy = power * _avail * _months;
        amount = energy * _tariff * 1.075;
      });
    }
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

    //check the state

    //check if it is number
   //  checkIfNumber();
  //hasLetter = true;
//    //for power we need current, voltage, power factor,pf
//    if (hasLetter) {
//      setState(() {
//        _v1 = 0;
//        _v2 = 0;
//        _v3 = 0;
//        _i1 = 0;
//        _i2 = 0;
//        _i3 = 0;
//        _pf = 0;
//
//      });


//        if (_i1Controller.text.contains(new RegExp(r'[0-9]+\.')) ||
//            _i2Controller.text.contains(new RegExp(r'[0-9]+\.')) ||
//            _i3Controller.text.contains(new RegExp(r'[0-9]+\.')) ||
//            _v1Controller.text.contains(new RegExp(r'[0-9]+\.')) ||
//            _v2Controller.text.contains(new RegExp(r'[0-9]+\.')) ||
//            _v3Controller.text.contains(new RegExp(r'[0-9]+\.'))) {

//        } else {
//          _v1 = 0;
//          _v2 = 0;
//          _v3 = 0;
//          _i1 = 0;
//          _i2 = 0;
//          _i3 = 0;
//          _pf = 0;
//        }
//
//    } else {
//      setState(() {
//        _i1 = double.tryParse(_i1Controller.text).abs();
//        _i2 = double.tryParse(_i2Controller.text).abs();
//        _i3 = double.tryParse(_i3Controller.text).abs();
//        _v1 = double.tryParse(_v1Controller.text).abs();
//        _v2 = double.tryParse(_v2Controller.text).abs();
//        _v3 = double.tryParse(_v3Controller.text).abs();
//        _pf = double.tryParse(_pfController.text).abs();
//      });
//
//
//      //  }
//    }
//    // taking the absolute values and finding the average
//    avCurrent = (_i1 + _i2 + _i3) / 3;
//    avVoltage = (_v1 + _v2 + _v3) / 3;
//    // three phase power calculation
//    result = (avCurrent * avVoltage * _pf * 3) / 1000;
//
//    return result;


//  //calculate the energy
//  double _energy() {
//    double result;
//    //get the result from _power()
//    double power = _power();
//    if (hasLetter) {
//      setState(() {
//        _avail = 0;
//        _months = 0;
//      });
//
//
//
//
//    } else {
//      setState(() {
//        _avail = double.tryParse(_availabilityController.text).abs();
//        _months = double.tryParse(_monthController.text).abs();
//      });
//
////
//
//    }
//    //calculate for energy
//    result = power * _avail * _months;
//    return result;
//  }
//
//  //calculate the amount
//  double _amount() {
//    double result;
//    //get the value of the energy
//    double energy = _energy();
//    if (hasLetter) {
//      setState(() {
//        _tariff = 0;
//      });
//
//    } else {
////      if(_tariffController.text.contains(new RegExp(r'[^0-9]'))){
////        _tariff =0;
////      }else {
//    setState(() {
//      _tariff = double.tryParse(_tariffController.text).abs();
//    });
//
//
//      //  }
//    }
//    // calculate the amount
//    //tariff in nigeria is 7.5% as at the time of this documentation
//    result = _tariff * energy * 1.075;
//
//    return result;
//  }
//


//  //checking if users type in values that are not numbers e.g letters and (: etc
//  void checkIfNumber() {
//    _v3Controller.text;
//
//    // it should contain string that begins with number and ends number
//    //and contains dot or/and number(s) in between
//    RegExp regExp = RegExp(r"^\d+((\.+)|(\d+))(\d)$", caseSensitive: false);
//    RegExp regExpDot = RegExp(r"^\d(?=\d)(?=\\.)|(?=\d)", caseSensitive: false);
//    RegExp regExpDot2 = RegExp(r"(\D)", caseSensitive: false);
//    RegExp regExpNotDot = RegExp("(?!\D)(?=\\.{0,1})", caseSensitive:  false);
//    RegExp regExp2 = RegExp(r'([a-zA-Z])|(,)|(-)|(\*)|(#)|(\+)|(\/)|(.*\..*\..*)');
//
//       if( _i1Controller.text.contains(regExp,)  ||
//           _i2Controller.text.contains(regExp,) ||
//           _i3Controller.text.contains(regExp)   ||
//           _v1Controller.text.contains(regExp )  ||
//           _v2Controller.text.contains(regExp)   ||
//           _v3Controller.text.contains(regExp )  ||
//           _pfController.text.contains(regExp)  ||
//           _monthController.text.contains(regExp)  ||
//           _availabilityController.text.contains(regExp, ) ||
//           _tariffController.text.contains(regExp)){
//        if (_v1Controller.text == "" ||
//           _v2Controller.text == ""||
//           _v3Controller.text== "" ||
//           _i1Controller.text== "" ||
//           _i2Controller.text== "" ||
//           _i3Controller.text== "" ||
//           _pfController.text== "" ||
//           _availabilityController.text== "" ||
//           _monthController.text== "" ||
//           _tariffController.text== "") {
//         setState(() {
//           hasLetter = true;
//         });
//
//
//       }
//
//
//        else if(_i1Controller.text.contains(regExp2,)  ||
//             _i2Controller.text.contains(regExp2,)  ||
//             _i3Controller.text.contains(regExp2,)  ||
//             _v1Controller.text.contains(regExp2,)  ||
//             _v2Controller.text.contains(regExp2,)  ||
//             _v3Controller.text.contains(regExp2,)  ||
//             _pfController.text.contains(regExp2,)  ||
//             _monthController.text.contains(regExp2,)  ||
//             _availabilityController.text.contains(regExp2,)  ||
//             _tariffController.text.contains(regExp2)){
//           setState(() {
//             hasLetter = true;
//           });
//
//
//         }
//         else{
//           setState(() {
//             hasLetter= false;
//           });
//
//         }
//
//       }
//        else if(
//          _i1Controller.text.contains(regExpDot,)  &&
//          _i2Controller.text.contains(regExpDot,) &&
//          _i3Controller.text.contains(regExpDot)   &&
//          _v1Controller.text.contains(regExpDot )  &&
//          _v2Controller.text.contains(regExpDot)   &&
//          _v3Controller.text.contains(regExpDot )  &&
//          _pfController.text.contains(regExpDot)  &&
//          _monthController.text.contains(regExpDot)  &&
//          _availabilityController.text.contains(regExpDot, ) &&
//          _tariffController.text.contains(regExpDot)){
////          if (_v1Controller.text == "" ||
////              _v2Controller.text == ""||
////              _v3Controller.text== "" ||
////              _i1Controller.text== "" ||
////              _i2Controller.text== "" ||
////              _i3Controller.text== "" ||
////              _pfController.text== "" ||
////              _availabilityController.text== "" ||
////              _monthController.text== "" ||
////              _tariffController.text== ""){
////            hasLetter = true;
////          }else{
//        setState(() {
//          hasLetter = false;
//        });
//
//         // }
//
//
//
//     }
//     else if (_v1Controller.text == "" ||
//        _v2Controller.text == ""||
//        _v3Controller.text== "" ||
//        _i1Controller.text== "" ||
//        _i2Controller.text== "" ||
//        _i3Controller.text== "" ||
//        _pfController.text== "" ||
//        _availabilityController.text== "" ||
//        _monthController.text== "" ||
//        _tariffController.text== "") {
//        setState(() {
//         hasLetter = true;
//        });
//
//
//    }
//    else if(_v1Controller.text.contains(regExp2,) &&
//        _v2Controller.text.contains(regExp2) &&
//        _v3Controller.text.contains(regExp2) &&
//        _i1Controller.text.contains(regExp2) &&
//        _i2Controller.text.contains(regExp2) &&
//        _i3Controller.text.contains(regExp2) &&
//        _pfController.text.contains(regExp2) &&
//        _availabilityController.text.contains(regExp2) &&
//        _monthController.text.contains(regExp2) &&
//        _tariffController.text.contains(regExp2)){
//     setState(() {
//       hasLetter = true;
//     });
//
//    }
//       else{
//         setState(() {
//           hasLetter = true;
//         });
//    //
//    }

 }

