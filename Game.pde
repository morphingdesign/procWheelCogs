// Class for interactivity
class GameAsset {
  
  // Class variables
  int titleBoxX = 140;
  int titleBoxY = 40;
  int titleBoxW = 240;
  int titleBoxH = 40;
  int guideBoxH = 100;
  int roundCorner = 5;
  int margin = 10;
  int alpha = 200;
  color colorStartButton = color(colorDarkTeal, alpha);
  boolean hoverStartButton = false;
  boolean introScreen = false;
  boolean resetScreen = false;
  String startTitle = "CLOCK LOCK";
  String startGuide = "The safe has partially unlocked with a malfunction. Click START and the highlighted broken center cog to open the safe.";
  String resetGuide = "Click the reset button to play again.";
  
  // *******************************************************
  // Constructor
  
  GameAsset(){
  
  }

  // *******************************************************
  // Game Class Methods
  
  
  
  void gameState(){
    if(gameInPlay){
      //println("gameInPlay:" + gameInPlay);
      openPartSafe = true;
      if(winGame){
        openFullSafe = true;
        lockSafe = false;
        //gameInPlay = false;
        //println("winGame:" + winGame);
        if(resetGame){
           resetState();
        }
      }
      else if(loseGame){                // loseGame state
        lockSafe = true;
        //gameInPlay = false;
        //println("loseGame:" + loseGame);
        if(resetGame){
           resetState();
        }
      }
      else{
        if(resetGame){
          resetState();
        }
      }
    }
    else{
      openPartSafe = false;
      lockSafe = true;
      resetGame = false;
      //println("startGameElse:" + startGame);
      //println("resetGameElse:" + resetGame);
      //println("GameInPlayElse:" + gameInPlay);
    }
  }
  

  void resetState(){
    startGame = false;
    gameInPlay = false;
    winGame = false;
    loseGame = false;
    lockSafe = true;
    openPartSafe = false;
    openFullSafe = false;
    safeXPos = 0;
    safeYPos = 0;
    hoverStartButton = false;
    introScreen = false;
    resetScreen = false;
    //safeXPos = width/2;
    //safeYPos = height/2;
    println("resetGame:" + resetGame);
    println("gameInPlay:" + gameInPlay);
    println("startGame:" + startGame);
    println("openFullSafe:" + openFullSafe);
    println("safeXPos:" + safeXPos);
    println("safeYPos:" + safeYPos);
    
  }


  void activateGame(){
     if(hoverStartButton && mousePressed){
       startGame = true;
       gameInPlay = true;
     }
     else if(startGame && gameInPlay){
       resetScreen = true;
     }
     else{
       introScreen = true;
     }
     
  }
  

  void resetGame(){
    if(resetScreen && hoverStartButton && mousePressed){
      resetGame = true;
    }
    else{
      //showResetScreen();
      showGameScreen();
    }
  }


  void showGameScreen(){
    if(!startGame && !resetScreen){
      splashScreenContent(startTitle, startGuide);
      startButton("START");
    }
    else if(startGame && resetScreen){
      splashScreenContent(startTitle, resetGuide);
      startButton("RESET");
    }
  }
  


  
  void splashScreenContent(String splashTitle, String splashText){

    noStroke();
    stroke(colorOrange);
    pushMatrix();
    fill(colorDarkTeal, alpha);
    rectMode(CENTER);
    translate(titleBoxX, titleBoxY);
    rect(0, 0, titleBoxW, titleBoxH, roundCorner);
    
    fill(colorOrange);
    textSize(30);
    textAlign(CENTER, CENTER);
    text(splashTitle, 0, -5);
    popMatrix();
    
    pushMatrix();
    fill(colorDarkTeal, alpha);
    translate(titleBoxX, titleBoxY + titleBoxH / 2 + margin + guideBoxH / 2);
    rect(0, 0, titleBoxW, guideBoxH, roundCorner);
    
    fill(255);
    textSize(14);
    textAlign(LEFT);
    text(splashText, margin / 2, margin / 2, titleBoxW - margin, guideBoxH); 
    popMatrix();
  }


  void startButton(String buttonText){
    int startButtonW = 140;
    int startButtonX = titleBoxX - titleBoxW / 2;
    int startButtonY = titleBoxY + titleBoxH / 2 + guideBoxH + margin * 2;
    
    pushMatrix();
    if(hoverStartButton){
      stroke(colorOrange);
      fill(colorDarkTeal);
    }
    else{
      noStroke();
      stroke(colorOrange);
      fill(colorStartButton);
    }
    rectMode(CORNER);
    translate(startButtonX, startButtonY);
    rect(0, 0, startButtonW, titleBoxH, roundCorner);
    fill(colorOrange);
    textSize(30);
    textAlign(CENTER, CENTER);
    text(buttonText, startButtonW / 2, titleBoxH / 2 - 5);
    updateStartButton(startButtonX, startButtonY, startButtonW, titleBoxH);
    popMatrix();
  }



  void updateStartButton(int bX, int bY, int bW, int bH){
    if(hoverButton(bX, bY, bW, bH)){
      hoverStartButton = true;
    }
    else{
      hoverStartButton = false;
    }
  }



  boolean hoverButton(int x, int y, int w, int h){
    if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h){
      return true;
    }
    else{
      return false;
    }
  }


}
