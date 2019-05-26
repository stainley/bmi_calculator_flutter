import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _ageController = new TextEditingController();
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();
  double _result = 0.0;
  String _message = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "images/bmilogo.png",
                    height: 110.6,
                    width: 100.2,
                  ),
                ),
              ),
              Container(
                color: Colors.grey.shade300,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _ageController,
                        decoration: InputDecoration(
                          labelText: "Age",
                          icon: Icon(Icons.person),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _heightController,
                        decoration: InputDecoration(
                          labelText: "Height in feet",
                          icon: Icon(Icons.assessment),
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _weightController,
                        decoration: InputDecoration(
                          labelText: "Weight in lb",
                          icon: Icon(Icons.line_weight),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.pinkAccent,
                        onPressed: () {
                          calculateBMI();
                        },
                        child: Text(
                          "Calculate",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _result > 0 ? "Your BMI: ${_result.toStringAsFixed(2)}" : "",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24.8,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _message == null ? "" : "$_message",
                  style: TextStyle(
                    color: Colors.red.shade400,
                    fontSize: 24.8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  calculateBMI() {
    setState(() {
      int age = 0;
      double inches = 0.0;
      double weight = 0.0;
      if (_ageController.text.isNotEmpty && _heightController.text.isNotEmpty){
        age = int.parse(_ageController.text);
        double height = double.parse(_heightController.text);
        inches = height * 12;
        weight = double.parse(_weightController.text);
      }





      if ((_ageController.text.isNotEmpty || age > 0) &&
          (_heightController.text.isNotEmpty || inches > 0) &&
          (_weightController.text.isNotEmpty || weight > 0)) {
        _result = weight / (inches * inches) * 703;

        if (_result < 18.5) {
          _message = "Underweight";
        } else if (_result >= 18.5 && _result < 25) {
          _message = "Normal";
        } else if (_result >= 25 && _result < 30) {
          _message = "Overweight";
        } else if (_result >= 30) {
          _message = "Obese";
        }
      } else {
        _result = 0.0;
        _message = "";
        return 0.0;
      }
    });
  }
}
