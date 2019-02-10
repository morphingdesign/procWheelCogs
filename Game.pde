// Class for interactivity
class GameAsset {
  
  // Class Variables
  int titleBoxX = 140;
  int titleBoxY = 40;
  int titleBoxW = 240;
  int titleBoxH = 40;
  int guideBoxH = 100;
  int roundCorner = 5;
  int margin = 10;
  int alpha = 220;
  color colorStartButton = color(colorDarkTeal, alpha);
  boolean hoverStartButton = false;
  String startTitle = "CLOCK LOCK";
  String startGuide = "The safe has partially unlocked with a malfunction. Click START and the highlighted broken center cog to open the safe.";
  String resetGuide = "Click the highlighted center cog to open the safe. Click RESET to start again and reveal other contents in the safe.";
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  
  GameAsset(){
  }
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // Manages the state of the game, including the position and open state of the safe door
  void gameState(){
    if(gameInPlay){
      openPartSafe = true;
      if(winGame){
        openFullSafe = true;
        if(resetGame){
           resetState();        // Resets conditions so that game can start as new after win has been achieved
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
      resetGame = false;
    }
  }
  
  // *******************************************************
  // Activates reset conditions so that game can start as new
  void resetState(){
    startGame = false;          
    gameInPlay = false;
    winGame = false;
    openPartSafe = false;
    openFullSafe = false;
    hoverStartButton = false;   
    safeImageCounter ++;        // Increment to show the next image for the safe contents the next time game is played
  }
  
  // *******************************************************
  // Activates game play and reset states by evaluating state of start/reset buttons
  void activateGame(){                      
     if(hoverStartButton && mousePressed){
       if(winGame){  
         resetGame = true;               // Reset game state when reset button activated
       }
       else{
         startGame = true;               // Start game when start button activated
         gameInPlay = true;
       }
     }
  }

  // *******************************************************
  // Displays the user guide and start/reset button based on game conditions
  void showGameScreen(){
    if(!startGame){                     // Display the start button and guide only when game is neither in play nor being reset
      splashScreenContent(startGuide);
      startButton("START");
    }
    else{                               // In all other conditions, display the reset button and reset guide
      splashScreenContent(resetGuide);
      startButton("RESET");
    }
  }
  
  // *******************************************************
  // Create text and bounding box for use with sketch title and UI
  // Includes string parameter to allow method to be reused between "Start" and "Reset" located in same coordinates 
  void splashScreenContent(String splashText){
    noStroke();
    stroke(colorOrange);
    pushMatrix();
    fill(colorDarkTeal, alpha);                       // Alpha parameter included to allow potential variation in transparency
    rectMode(CENTER);
    translate(titleBoxX, titleBoxY);
    rect(0, 0, titleBoxW, titleBoxH, roundCorner);    // Create title bounding box
    
    fill(colorOrange);
    textSize(30);
    textAlign(CENTER, CENTER);
    text(startTitle, 0, -5);                          // Create title text within title bounding box
    popMatrix();
    
    pushMatrix();
    fill(colorDarkTeal, alpha);
    translate(titleBoxX, titleBoxY + titleBoxH / 2 + margin + guideBoxH / 2);
    rect(0, 0, titleBoxW, guideBoxH, roundCorner);    // Create guide bounding box
    
    fill(255);
    textSize(14);
    textAlign(LEFT);
    text(splashText, margin / 2, margin / 2, titleBoxW - margin, guideBoxH);   // Create guide text within guide bounding box
    popMatrix();
  }

  // *******************************************************
  // Create start button geometry and logic for button functionality
  // Includes string parameter to allow button to be reused between "Start" and "Reset" located in same coordinates
  void startButton(String buttonText){     
    
    // Local variables for use within startButton relating its size to the adjacent text box
    int startButtonW = 140;
    int startButtonX = titleBoxX - titleBoxW / 2;
    int startButtonY = titleBoxY + titleBoxH / 2 + guideBoxH + margin * 2;
    
    pushMatrix();
    if(hoverStartButton){        // Reads state of boolean when mouse hovers over start button
      stroke(colorBlack);        // Change color of button stroke and fill upon hover
      fill(colorDarkTeal);
    }
    else{                        // Default state and color for button when not hovered
      noStroke();                
      stroke(colorOrange);
      fill(colorStartButton);
    }
    rectMode(CORNER);      
    translate(startButtonX, startButtonY);
    rect(0, 0, startButtonW, titleBoxH, roundCorner);       // Create button shape
    fill(colorOrange);
    textSize(30);
    textAlign(CENTER, CENTER);
    text(buttonText, startButtonW / 2, titleBoxH / 2 - 5);  // Create text within button shape
    updateStartButton(startButtonX, startButtonY, startButtonW, titleBoxH);    // Pass button coordinates to method for testing if in hover state
    popMatrix();
  }

  // *******************************************************
  // Method using a boolean to identify if mouse is hovering over its geometry
  void updateStartButton(int bX, int bY, int bW, int bH){
    if(hoverButton(bX, bY, bW, bH)){      
      hoverStartButton = true;
    }
    else{
      hoverStartButton = false;
    }
  }

  // *******************************************************
  // Method returns boolean state identifying if mouse position is hovering over unique coordinates
  boolean hoverButton(int x, int y, int w, int h){
    if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h){
      return true;          
    }
    else{
      return false;
    }
  }
}
