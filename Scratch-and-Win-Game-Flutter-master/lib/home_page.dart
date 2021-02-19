import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AudioCache audioCache = new AudioCache();
  AudioPlayer advancedPlayer = new AudioPlayer();

  

  // Loading the asset images
  AssetImage blank = AssetImage("images/blank.png");
  AssetImage unlucky = AssetImage("images/sad.png");
  AssetImage lucky = AssetImage("images/money.png");

  // Making an array which will be used to display items.
  List<String> itemArray;
  // This number will be used to display the cash image at a particular block
  int luckyNumber;
// To keep the track of the count
  int count=0;
  // For displaying a message with each app state
  String message="";

  // This function will be used to generate a number on which cash image will be displayed
  generateRandomNumber(){
    int random=Random().nextInt(25);
    setState(() {
      luckyNumber=random;
      print('this is $luckyNumber');
    });
  }

  // For initializing the array 
  @override
  void initState(){
    super.initState();
    itemArray=List<String>.generate(25, (index)=>"empty");
    generateRandomNumber();
    // audioCache. play('2.mp3');
  }

  // This function will be used to display a message in the 
  // child text box when max tries reached
  displayMessage(){
    setState(() {
      message="You have reached Maximum tries";
      Delay();
    });
  }

  // Delay function
  Delay(){
    Future.delayed(const Duration(milliseconds: 1600),(){
      setState(() {
        this.resetGame();
        count=0;
      });
    });
  }

  // used for displaying the images according to their respective keywords
  AssetImage getImage(int index){
    String currentState=itemArray[index];
    switch(currentState){
      case "lucky":
      return lucky;
      break;
      case "unlucky":
      return unlucky;
      break;
    }
    return blank;
  }

  // used for playing the game
  playgame(int index){
    if(luckyNumber==index){
      setState(() {
        itemArray[index]="lucky";
        audioCache.play('cash.wav');
        this.message="Yay you got it";
        Delay();
      });
    }else if(luckyNumber!=index && count<=5){
      setState(() {
        itemArray[index]="unlucky";
        count++;
      });
      if(count==5){
        audioCache.play('aww.mp3');
        displayMessage();
      }
      if(count==4){
        this.message="last one and you are gone";
      }
      if(count==3){
        this.message="2 more left. think wisely";
      }
      if(count==2){
        this.message="yes you can win";
      }
      if(count==1){
        this.message="there is a long way to go";
      }
    }
  }

  // Reset all function for resetting the images which are displayed on the game screen
  resetGame(){
    setState(() {
      itemArray=List<String>.filled(25,"empty");
      this.message="";
      this.count=0;
    });
    generateRandomNumber();
  }

  // showing all the images or either the sad or the cash
  showAll(){
    setState(() {
      itemArray=List<String>.filled(25,"unlucky");
      itemArray[luckyNumber]="lucky";
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title: Text(
          "Scratch and Win",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Expanded used to fill in the space available to its children
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              // SGDWFCAC will create grids with maximum cross axis alignment.
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisCount: 5,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
              ),
              itemCount: 25,

              // item array needs to be changed when we work on the array.

              itemBuilder: (context, i) => SizedBox(
                width: 50,
                height: 50,
                child: RaisedButton(
                  padding: EdgeInsets.all(1),
                  onPressed: () {
                    playgame(i);
                    // Here the function will be coming which will be executed on button press
                  },
                  child: Image(
                    image: this.getImage(i), 
                    height: 40, width: 40,
                  ),
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(100, 12, 100, 12),
                color: Colors.orange[400],
                child: Text(
                  this.message,style: TextStyle(fontSize: 10), //Here the message will be coming
                ),
              )
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    onPressed: () {
                      this.resetGame();
                    },
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    color: Colors.lime,
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    onPressed: () {
                      this.showAll();
                    },
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    color: Colors.lime,child: Text("Show all",style:TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            padding:EdgeInsets.fromLTRB(120, 10, 100, 10),color: Color(0xFF47535E),child: Text("Developed by Harsh, Taught by Hitesh",style: TextStyle(color: Colors.white),),
          ),Container(

          ),
        ],
      ),
    );
  }
}
