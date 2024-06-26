// Instruction page should start with "select test" and then take you to the instruction

import 'package:flutter/material.dart';
import 'package:water_quality_app/notNeeded/select_tester_type.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});
  // style elevated button
  final ButtonStyle styleButton = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontFamily: 'Comfortaa', fontSize: 20),
      backgroundColor: Colors.cyan);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: "Water Quality Testing App",
                  style: TextStyle(
                      color: Color.fromARGB(255, 49, 227, 209),
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),
            ]),
          ),
        ),*/
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/waterbackground.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
            constraints: const BoxConstraints.expand(),
            child: SafeArea(
                child: Center(
                    child: Column(
              children: [
                //Image.asset("assets/waterbackground.jpg"),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      padding: const EdgeInsets.all(0.0),
                      //color: Colors.blueGrey,
                      width: 500.0,
                      height: 250.0,
                    )),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.blueGrey.withOpacity(0.5),
                  child: const Text("welcome",
                      style: TextStyle(
                        color: Colors.white, //.fromARGB(255, 49, 227, 209),
                        fontSize: 50,
                        fontFamily: 'Ultra',
                        //fontWeight: FontWeight.bold
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                    padding: const EdgeInsets.all(0.0),
                    //color: Colors.green,
                    width: 20.0,
                    height: 20.0,
                  ), //Container
                ), //
                ElevatedButton(
                  key: const Key('selectbutton'),
                  style: styleButton,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectTesterPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'select a test',
                    style: TextStyle(fontSize: 35, fontFamily: "Comfortaa"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                    padding: const EdgeInsets.all(0.0),
                    //color: Colors.blueGrey,
                    //width: 550.0,
                    height: 25.0,
                  ),
                ),
                //Image.asset("assets/waterbackground.jpg"),
              ],
            )))));
  }
}
