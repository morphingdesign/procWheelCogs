// Clock Lock Sketch/Program
// by Hans Palacios
// for SCAD ITGM 719 Course
// *******************************************************

/** 


INCLUDE PROJECT DESCRIPTION

The safe's bolts have become partially unlocked and the system has malfunctioned
Identify the broken cogs and select them to allow the system to fully
open the safe.
Select the red cogs to repair them before the time runs out completely disabling
the system and locking the safe for good.

**/


// *******************************************************
// Global variables
Scene mainScene;
Portal safeDoor;
Game clockLockGame;

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

// Interactivity toggles
boolean startGame = false;
boolean openPartSafe = false;
boolean cogToggle = false;
int randCog1;
int randCog2;
float retraction;

// *******************************************************

void setup() {
  size(1000, 1000);

  mainScene = new Scene();
  safeDoor = new Portal();
  clockLockGame = new Game();
  
}


void draw() {
  background(colorDarkTeal);

  
  // Initiate game and interactivity
  clockLockGame.activateGame(); 
  clockLockGame.splashScreen();
  
  // Create scene elements
  mainScene.createBkgdCogs();    // Rotating cogs in background
  mainScene.createSafeFrame();   // Static frame of the safe
  safeDoor.create();             // Door to the safe
  
  // Game actions
  //safeDoor.move();
  
 
  
    
}
