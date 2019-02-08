// Clock Lock Sketch/Program
// by Hans Palacios
// for SCAD ITGM 719 Course
// *******************************************************

/** 


INCLUDE PROJECT DESCRIPTION

The safe's bolts have become partially unlocked with the system malfunctioning.
Click on the highlighted broken cogs to allow the system to fully open the safe.
Winning will open the safe door revealing the safe's contents.

**/


// *******************************************************
// Global variables
Scene mainScene;
Portal safeDoor;
GameAsset clockLockGame;

float safeXPos = width/2;
float safeYPos = height/2;
float safeShift = 0;
float xPos;
float yPos;
float speed = 1;
float reverseSpeed = speed * -1;

// Colors
color colorWhite = color(255, 255, 255);
color colorDarkTeal = color(0, 147, 170);
color colorLightTeal = color(51, 182, 203);
color colorDarkBrown = color(102, 69, 6);
color colorLightBrown = color(161, 130, 71);
color colorLightTan = color(255, 211, 129);
color colorDarkTan = color(129, 84, 0);
color colorOrange = color(255, 167, 0);
color colorGradient = color(195, 135, 20);
color colorButtonHighlight = color(255);
color colorButtonSelected = color(0);

// Interactivity toggles
boolean startGame = false;
boolean gameInPlay = false;
boolean winGame = false;
boolean loseGame = false;
boolean resetGame = false;
boolean lockSafe = true;
boolean openPartSafe = false;
boolean openFullSafe = false;
float retraction;

// *******************************************************

void setup() {
  size(1000, 1000);

  clockLockGame = new GameAsset();
  mainScene = new Scene();
  safeDoor = new Portal();
  
  
}


void draw() {
  background(colorDarkTeal);
  
  clockLockGame.gameState();
  clockLockGame.activateGame();  // Initiate game
  clockLockGame.resetGame();
  
  
  // Create scene elements
  mainScene.createBkgdCogs();    // Rotating cogs in background
  mainScene.createSafeFrame();   // Static frame of the safe
  mainScene.createSafeContent();
  safeDoor.create();             // Door to the safe
  
  // Game actions
  
  clockLockGame.showIntroScreen();
  //clockLockGame.showResetScreen();
  safeDoor.portalInPlay();
  
  
  //safeDoor.movePortal();
    
}
