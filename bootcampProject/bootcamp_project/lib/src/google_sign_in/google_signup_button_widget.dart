import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: OutlineButton.icon(
        label: Text(
          'Google Sign In',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24,),
        highlightedBorderColor: Colors.black,
        borderSide: BorderSide(color: Colors.black,),
        textColor: Colors.black,
        icon: FaIcon(FontAwesomeIcons.google, color: Colors.purple),
        onPressed: (){
          //final provider = Provider.of
        },
      ),
    );
  }
}
