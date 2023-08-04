import 'package:flutter/material.dart';

class Fahrenheit extends StatefulWidget {
  const Fahrenheit({super.key});

  @override
  State<Fahrenheit> createState() => _FahrenheitState();
}

class _FahrenheitState extends State<Fahrenheit> {
  Color c1 = const Color(0xFFFFE0B2);
  String? _temperatureItems;
  String? _temperatureItems1;

  String holder = '';
  String holder1 = '';
  late double input;
  String output = '0';
  final TextEditingController controller1 = TextEditingController(text: '');

  void process() {
    setState(() {
      if (holder == '') {
        output = 'Choose Unit';
      }
      holder = _temperatureItems!;

      input = double.tryParse(controller1.text) ?? 0;

      if (holder == 'Degree Fahrenheit') {
        output = input.toString();
      } else if (holder == 'Degree Celsius' ) {
        output = (((input * 9) / 5) + 32).toString();
      } else if (holder == 'Kelvin') {
        output = ((((input - 273.15) * 9) / 5) + 32).toString();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios_new_rounded,
            color: Colors.brown),
        ),
        backgroundColor: c1,
        title: Text(
          "To Fahrenheit",
          style: TextStyle(
            color: Colors.brown,
            fontFamily: "Itim",
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
      ),
      body:Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                labelText: 'Enter Value',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              controller: controller1,
            ),
            width: 390,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: DropdownButton<String>(
              items: [

                DropdownMenuItem<String>(
                  child: Text('Degree Celsius'),
                  value: 'Degree Celsius',
                ),
                DropdownMenuItem<String>(
                  child: Text('Kelvin'),
                  value: 'Kelvin',
                )
              ],
              onChanged: (String? value) {
                setState(() {
                  _temperatureItems = value;
                });
              },
              hint: Text('Select'),
              value: _temperatureItems,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                labelText: 'Output: $output',
                labelStyle: TextStyle(color: Colors.grey[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              enabled: false,
            ),
            width: 390,
          ),
          Container(child: Center(child: Text("Degree Fahrenheit",style: TextStyle(
              fontSize: 16
          ),)),
            height: 50,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black,),
                borderRadius:BorderRadius.circular(15)
            ),
          ),
          Padding(padding: EdgeInsets.all(13))
          ,ElevatedButton(
            onPressed: process,
            child: Text('Process'),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange[500],
              onPrimary: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          )
        ],
      ),
    );
  }
}