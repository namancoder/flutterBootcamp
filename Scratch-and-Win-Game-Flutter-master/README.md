# scratch_and_win_game_flutter

A simple scratch and win game where you have a grid of 25 blocks out of which only one block has the prize and you win when you find the correct one.
**About the app**<br>
This Flutter app allows the user to select any 5 block from the total 25 present out of which only one has the prize. If you figure out which block it is on or before 5th try then you win, else you lose and the game will reset itself. It's a game of Luck. Good Luck!
<br>I was inspired to make this game after seeing one of my friend make this.<br>The initial screen has two buttons taking you to the game or rules respectively.<br>Things which are donw in this app invove:-<br>
* Stateful and stateless widget
* layout building
* Various images display
* Audioplayer and audio cache
* Raised buttons
* List Grid view etc.
* Navigator
___
Logic:- When the game will load a random number will be generated automatically on which the cash image will be displayed which will make you win. <br>The 25 boxes which are also displayed are buttons which will be triggered when we press them and are stored in the list. These buttons have a index number which is matched with the random to decide whether we win or loose. <br>Another variable count is there which keeps the track of count/ your chances. <br>We have a reset button which will be resetting the game if you want to start from the beginning. <br>Different text are also displayed in the Text view according to the state of the game. <br>Audios are also played accordingly.<br>Show all button is responsible for showing all the images on the blocks.
___
Built using:-
* Flutter
___
Some snaps from the app:- <br>
Full video:- https://youtu.be/pYy_gR2oxlc <br>
![Initial screen](https://res.cloudinary.com/harshkumarkhatri/image/upload/v1595322349/readme%20images/scratch%20and%20win%20game%20flutter/WhatsApp_Image_2020-07-21_at_2.19.41_PM_2_bnwdfr.jpg)
![rules](https://res.cloudinary.com/harshkumarkhatri/image/upload/v1595322349/readme%20images/scratch%20and%20win%20game%20flutter/WhatsApp_Image_2020-07-21_at_2.19.41_PM_1_li0zbe.jpg)
![Empty boxes](https://res.cloudinary.com/harshkumarkhatri/image/upload/v1595322374/readme%20images/scratch%20and%20win%20game%20flutter/WhatsApp_Image_2020-07-21_at_2.19.40_PM_2_nfbzfi.jpg)
![first click](https://res.cloudinary.com/harshkumarkhatri/image/upload/v1595322373/readme%20images/scratch%20and%20win%20game%20flutter/WhatsApp_Image_2020-07-21_at_2.19.40_PM_3_zndjtj.jpg)
![Show all triggered](https://res.cloudinary.com/harshkumarkhatri/image/upload/v1595322373/readme%20images/scratch%20and%20win%20game%20flutter/WhatsApp_Image_2020-07-21_at_2.19.41_PM_kqymuv.jpg)
![Game lost](https://res.cloudinary.com/harshkumarkhatri/image/upload/v1595322374/readme%20images/scratch%20and%20win%20game%20flutter/WhatsApp_Image_2020-07-21_at_2.19.40_PM_lm8rfi.jpg)
![Game won](https://res.cloudinary.com/harshkumarkhatri/image/upload/v1595322374/readme%20images/scratch%20and%20win%20game%20flutter/WhatsApp_Image_2020-07-21_at_2.19.40_PM_1_sa7xzd.jpg)

##
->use of AudioPlayer and AudioCache

