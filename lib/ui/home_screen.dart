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
  String _message;

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
                        keyboardType: TextInputType.number,
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
                  "Your BMI: ${_result.toStringAsFixed(2)}",
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
                  "$_message",
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
      int age = int.parse(_ageController.text);
      double inches = 0.0;
      double height = double.parse(_heightController.text);
      inches = height * 12;
      double weight = double.parse(_weightController.text);

      if ((_ageController.text.isNotEmpty || age > 0) &&
          (_heightController.text.isNotEmpty || inches > 0) &&
          (_weightController.text.isNotEmpty || weight > 0)) {
        _result = weight / (inches * inches) * 703;

        if (_result > 23) {
          _message = "Overweight";
        } else {
          _message = "Normal";
        }
      } else{
        _result = 0.0;
        return 0.0;
      }
    });
  }
}
