import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("Sign Up",),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 10,),
            Container(
//              width: 160,
              alignment: Alignment.center,
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(50),
//                border: Border.all(
//                  color: Colors.red,
//                  width: 2
//                )
//              ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSZILQdcAimYV79fZ5pkR2F8YefkZQNtTzMtQ&usqp=CAU'),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                readOnly: false,
                decoration: InputDecoration(
//                  Hint text is displayed when we click on the text field.
                  hintText: "Enter your name",
                  border: OutlineInputBorder(),
                  labelText: "Name",
                  icon: Icon(
                    Icons.people
                  )
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                readOnly: false,
                decoration: InputDecoration(
//                  Hint text is displayed when we click on the text field.
                    hintText: "Enter your username",
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    icon: Icon(
                        Icons.account_circle
                    )
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                readOnly: false,
                decoration: InputDecoration(
//                  Hint text is displayed when we click on the text field.
                    hintText: "Enter your email",
                    border: OutlineInputBorder(),
                    labelText: "E-mail",
                    icon: Icon(
                        Icons.mail
                    )
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                readOnly: false,
                decoration: InputDecoration(
//                  Hint text is displayed when we click on the text field.
                    hintText: "Enter your Password",
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    icon: Icon(
                        Icons.lock
                    )
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            RaisedButton(
              onPressed: (){

              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: Colors.black)
              ),
              textColor: Colors.white,
              padding: EdgeInsets.all(0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),

                padding: EdgeInsets.all(10),
                child: Text("Submit",style:TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}