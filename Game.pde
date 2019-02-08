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
  color colorStartButton = color(255, alpha);
  boolean hoverStartButton = false;
  String startTitle = "CLOCK LOCK";
  String startGuide = "The safe has become partially unlocked with a malfunction. Click on the broken red cogs to open the safe.";
  String resetGuide = "Click the reset button to play again.";
  
  // *******************************************************
  // Constructor
  
  GameAsset(){
  
  }

  // *******************************************************
  // Game Class Methods
  
  
  

  




  void activateGame(){
     if(hoverStartButton && mousePressed){
       startGame = true;
       gameInPlay = true;
     }
     else{
       showIntroScreen();
     }
     
  }
  


  void showIntroScreen(){
    if(!startGame){
      splashScreenContent(startTitle, startGuide);
      startButton("START");
    }
  }
  
  void showResetScreen(){
    if(winGame || loseGame){
      splashScreenContent(startTitle, resetGuide);
      startButton("RESET");
    }
  }
  


  
  void splashScreenContent(String splashTitle, String splashText){

    noStroke();
    
    pushMatrix();
    fill(colorWhite, alpha);
    rectMode(CENTER);
    translate(titleBoxX, titleBoxY);
    rect(0, 0, titleBoxW, titleBoxH, roundCorner);
    
    fill(colorOrange);
    textSize(30);
    textAlign(CENTER, CENTER);
    text(splashTitle, 0, -5);
    popMatrix();
    
    pushMatrix();
    fill(colorWhite, alpha);
    translate(titleBoxX, titleBoxY + titleBoxH / 2 + margin + guideBoxH / 2);
    rect(0, 0, titleBoxW, guideBoxH, roundCorner);
    
    fill(0);
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
      fill(colorButtonSelected);
    }
    else{
      fill(colorStartButton);
    }
    noStroke();
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
    if(hoverRectButton(bX, bY, bW, bH)){
      hoverStartButton = true;
    }
    else{
      hoverStartButton = false;
    }
  }



  boolean hoverRectButton(int x, int y, int w, int h){
    if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h){
      return true;
    }
    else{
      return false;
    }
  }


}
