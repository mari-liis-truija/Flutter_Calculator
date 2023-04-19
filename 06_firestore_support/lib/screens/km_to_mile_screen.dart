import 'package:flutter/material.dart';

class KmToMileScreen extends StatefulWidget {
  @override
  _KmToMileScreenState createState() => _KmToMileScreenState();
}

class _KmToMileScreenState extends State<KmToMileScreen> {
  double? _kmValue;
  double? _mileValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kilometer to Mile Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Kilometers',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _kmValue = double.tryParse(value);
                  _mileValue = null;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Convert'),
              onPressed: () {
                setState(() {
                  _mileValue = _kmValue! * 0.621371;
                });
              },
            ),
            SizedBox(height: 16.0),
            if (_mileValue != null)
              Text(
                'Miles: ${_mileValue!.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
