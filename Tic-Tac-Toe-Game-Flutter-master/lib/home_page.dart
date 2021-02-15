import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game_flutter/game_button.dart';
import 'custom_dailog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButton> buttonList;
  var player1;
  var player2;
  var activeplayer;

  @override
  void initState() {
    super.initState();
    buttonList = doInit();
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activeplayer == 1) {
        gb.text = 'x';
        gb.bg = Colors.red;
        activeplayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = '0';
        gb.bg = Colors.black;
        activeplayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner=checkWinner();
      if(winner==-1){
        if(buttonList.every((p) => p.text!="")){
          showDialog(context: context,
          builder: (_)=>CustomDailog("Game tied", "Press the reset button to star again", resetGame));
        }else{
          activeplayer==2?autoPlay():null;
        }
      }
    });
  }
  void autoPlay() {
    var emptyCells = new List();
    var list = new List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var r = new Random();
    var randIndex = r.nextInt(emptyCells.length-1);
    var cellID = emptyCells[randIndex];
    int i = buttonList.indexWhere((p)=> p.id == cellID);
    playGame(buttonList[i]);

  }

  int checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3))
      winner = 1;
    if (player2.contains(1) && player2.contains(2) && player2.contains(3))
      winner = 2;

    if (player1.contains(4) && player1.contains(5) && player1.contains(6))
      winner = 1;
    if (player2.contains(4) && player2.contains(5) && player2.contains(6))
      winner = 2;

    if (player1.contains(7) && player1.contains(8) && player1.contains(9))
      winner = 1;
    if (player2.contains(7) && player2.contains(8) && player2.contains(9))
      winner = 2;

    if (player1.contains(1) && player1.contains(4) && player1.contains(7))
      winner = 1;
    if (player2.contains(1) && player2.contains(4) && player2.contains(7))
      winner = 2;

    if (player1.contains(2) && player1.contains(5) && player1.contains(8))
      winner = 1;
    if (player2.contains(2) && player2.contains(5) && player2.contains(8))
      winner = 2;

    if (player1.contains(6) && player1.contains(3) && player1.contains(9))
      winner = 1;
    if (player2.contains(6) && player2.contains(3) && player2.contains(9))
      winner = 2;

    if (player1.contains(1) && player1.contains(5) && player1.contains(9))
      winner = 1;
    if (player2.contains(1) && player2.contains(5) && player2.contains(9))
      winner = 2;

    if (player1.contains(5) && player1.contains(3) && player1.contains(7))
      winner = 1;
    if (player2.contains(5) && player2.contains(3) && player2.contains(7))
      winner = 2;

    if (winner != -1) {
      if (winner == 1) {
        // Custom dialog
        showDialog(
            context: context,
            builder: (_) => new CustomDailog("Player 1 won",
                "Press the reset button to start again", resetGame));
      } else {
        // custom dailog
        showDialog(
            context: context,
            builder: (_) => new CustomDailog("Player 2 won",
                "Press the reset button to start again", resetGame));
      }
    }
    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonList = doInit();
    });
  }

  void resetGame2() {
    if (!(Navigator.canPop(context))) Navigator.pop(context);
    setState(() {
      buttonList = doInit();
    });
  }

  List<GameButton> doInit() {
    player1 = List();
    player2 = List();
    activeplayer = 1;

    var gameButtons = <GameButton>[
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9),
    ];
    return gameButtons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Player"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: buttonList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 9),
              itemBuilder: (context, i) => new SizedBox(
                width: 100,
                height: 100,
                child: RaisedButton(
                  padding: EdgeInsets.all(8),
                  onPressed: buttonList[i].enabled
                      ? () => playGame(buttonList[i])
                      : null,
                  child: Text(
                    buttonList[i].text,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: buttonList[i].bg,
                  disabledColor: buttonList[i].bg,
                ),
              ),
            ),
          ),
          RaisedButton(
            child: Text(
              "Reset",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            color: Colors.red,
            padding: EdgeInsets.all(20),
            onPressed: resetGame2,
          ),
        ],
      ),
    );
  }
}
