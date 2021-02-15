import 'package:flutter/material.dart';
import 'home_page.dart';
import 'home_page.dart';
import 'double_hom_page.dart';

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
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Tic Tac Toe Game",style: TextStyle(fontSize: 40,color: Colors.amber,),)],),
          SizedBox(height: 20,),
          Container(child: CircleAvatar(
                radius: 210,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                    'https://media.giphy.com/media/KzKFAvaM1RBoRU5dcl/giphy.gif'),
              ),),
          SizedBox(height: 20),
          DropdownButton(
            dropdownColor: Colors.red,
            value: _selectedPlayer,
            items: _dropDownItem(),
            onChanged: (value) {
              _selectedPlayer = value;
              switch (value) {
                case "Single Player":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  break;
                case "Double Player":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoubleHomePage()),
                  );
                  break;
              }
            },
            hint: Container(
              alignment: Alignment.centerRight,
              width: 210,
              child: Text(
                'Select Player',
                textAlign: TextAlign.end,
                style: TextStyle(backgroundColor: Colors.amber),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = ["Single Player", "Double Player"];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }
}




