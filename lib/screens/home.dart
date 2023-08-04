import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:temp_converter/convert/to_celsius.dart';
import 'package:temp_converter/convert/to_kelvin.dart';
import 'package:temp_converter/convert/to_farenheit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color c1 = const Color(0xFFFFE0B2);

  final List<String> imagesList = [
    'assets/img_1.png',
    'assets/tc1.jpg',
    'assets/img.png',
  ];
  final List<String> Namelist=[
    'To Celsius',
    'To Kelvin',
    'To Farenheit'
  ];
  get convert=>[
    Celsius(),
    Kelvin(),
    Fahrenheit()

  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: c1,
        title: Text(
          "Temperature Converter",
          style: TextStyle(
            color: Colors.brown,
            fontFamily: "Itim",
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
      ),
      body: Column(children: [
        Expanded(
          child: Stack(children: [
            Positioned(
              top: 20,
              left: -20,
              child: Container(
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/ii.jpg"),
                      alignment: Alignment.center,
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(190),
                  ),
                ),
              child:Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                  ),
                  SizedBox(
                    width: size.width*.1,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                  ),
                  SizedBox(
                    width: size.width*.1,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                    ),
                  ),
                ],
              ),

              ),
            ),
          ]),
        ),
        Expanded(
          flex: 3,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
            ),
            items: imagesList.asMap().entries.map(
                  (entry) {
                int index = entry.key; // Get the index of the current entry
                String item = entry.value; // Get the current item
                String name =
                Namelist[index]; // Get the corresponding name from NameList

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    margin: EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    elevation: 13.0,
                    shadowColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            item,
                            fit: BoxFit.fill,
                            width: double.infinity,
                            // height: double.infinity,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: size.width * .4,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  onPrimary: Colors.brown,
                                    primary: Colors.orange[500],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(15))),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => convert[index]),
                                  );
                                },
                                child: Text(name,style: TextStyle(fontSize: 20,color: Colors.white),), // Use the name variable here
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),

        Expanded(
            child: Stack(children: [
              // Positioned(
              //   top: -100,
              //   left: 10,
              //   child: Container(
              //       height: size.width * .5,
              //       width: size.width * .6,
              //       decoration: BoxDecoration(
              //           image: DecorationImage(
              //               image: AssetImage("assets/img_1.png"),
              //               alignment: Alignment.center,
              //               fit: BoxFit.cover),
              //           shape: BoxShape.circle)),
              // ),
              Positioned(
                top: 20,
                left: 180,
                child: Container(
                  height: 270,
                  width: 230,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/ii.jpg"),
                        alignment: Alignment.center,
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(190),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ]))
      ]),
    );
  }
}

