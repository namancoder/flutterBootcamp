import 'package:flutter/material.dart';
import 'home_page.dart';
import 'double_hom_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      home: FirstScreen(),
    );
  }
}

//

class FirstScreen extends StatelessWidget {
  String _selectedPlayer = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 2)
          ]),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.purple[900],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tic Tac Toe",
                    style: GoogleFonts.oswald(
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: CircleAvatar(
                radius: 210,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage(
                    'assets/images/javascript-tic-tac-toe-tutorial-react.png')),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(
                    child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text("Computer"),
                  color: Colors.black,
                  textColor: Colors.white,
                )),
                Expanded(
                    child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DoubleHomePage()),
                    );
                  },
                  child: Text("Versus"),
                  color: Colors.black,
                  textColor: Colors.white,
                )),
              ],
            ),
          )
          // DropdownButton(
          //   dropdownColor: Colors.red,
          //   value: _selectedPlayer,
          //   items: _dropDownItem(),
          //   onChanged: (value) {
          //     _selectedPlayer = value;
          //     switch (value) {
          //       case "Single Player":
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => HomePage()),
          //         );
          //         break;
          //       case "Double Player":
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => DoubleHomePage()),
          //         );
          //         break;
          //     }
          //   },
          //   hint: Container(
          //     alignment: Alignment.centerRight,
          //     width: 210,
          //     child: Text(
          //       'Select Player',
          //       textAlign: TextAlign.end,
          //       style: TextStyle(backgroundColor: Colors.amber),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  // List<DropdownMenuItem<String>> _dropDownItem() {
  //   List<String> ddl = ["Single Player", "Double Player"];
  //   return ddl
  //       .map((value) => DropdownMenuItem(
  //             value: value,
  //             child: Text(value),
  //           ))
  //       .toList();
  // }
}
