// CLOCK LOCK SKETCH/PROGRAM
// by Hans Palacios
// for SCAD ITGM 719 Course
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/** PROJECT DESCRIPTION
    This interactive sketch is composed of a dynamic set of shapes representing 
    cogs and bolts with a safe door.  The center of the safe door is a series of 
    cogs depicting the hour, minute, and second, with each one updating live.  Upon
    clicking the start button in the guide user interface, the safe's bolts become 
    partially unlocked to represent a system malfunction in the safe door operation.
    Clicking on the highlighted broken cog in the center allows the system to fully
    open the safe and revealing the safe's contents.
    --------------------------------------------------------------------------------
    REFERENCED CODE
    Code referenced from online sources are identified with comments and delineated
    with the following syntax:
    
        // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
        Referenced code located here along with cited web link.
        // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
        
    Currently, the only referenced code is located within the Bolt() class.    
    --------------------------------------------------------------------------------    
    IMAGES
    The PNG images used for the safe content within this program and located in the
    accompanying 'data' folder were created by Hans Palacios.  Each were modeled, 
    textured, and rendered in SideFX Houdini.
**/

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Global variables
/** The majority of these global variables are used and defined to creat consistency 
    throughout the sketch and its contents built from various classes.  
**/

Scene mainScene;                         // Static graphics
Portal safeDoor;                         // Dynamics safe door graphics
GameAsset clockLockGame;                 // Game interactivity

// Positions
float safeXPos = width/2;                // This defines the center of the safe door which
float safeYPos = height/2;               // opens by moving from center to the right
float xPos;
float yPos;
float speed = 1;                         // Used to control the speed of the cog rotations
float reverseSpeed = speed * -1;

// Colors
// Colors are all managed here to universally define the color scheme.
color colorWhite = color(255);
color colorBlack = color(0);
color colorDarkTeal = color(0, 147, 170);
color colorLightTeal = color(51, 182, 203);
color colorDarkBrown = color(102, 69, 6);
color colorLightBrown = color(161, 130, 71);
color colorLightTan = color(255, 211, 129);
color colorDarkTan = color(129, 84, 0);
color colorOrange = color(255, 167, 0);
color colorGradient = color(195, 135, 20);
color colorButtonLight = color(175);
color colorButtonDark = color(120);          

// Game toggles
/** Booleans are used to define the state of the game as it progresses and applied to 
    various functions and methods to initiate shape changes
**/    
boolean startGame = false;
boolean gameInPlay = false;
boolean winGame = false;
boolean resetGame = false;
boolean openPartSafe = false;
boolean openFullSafe = false;
boolean cogSelected = false;

// Game Content
float retraction;                        // Defines the state of bolt retraction for opening safe
PImage[] safeContent = new PImage[2];    // Array of images can increase to add additional images
int safeImageCounter = 0;                // Keeps track of the index for the safe content images

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void setup() {
  size(1000, 1000);

  clockLockGame = new GameAsset();                 // Initiates a new game with internal game logic
  mainScene = new Scene();                         // Initiates a new object for all static graphics
  safeContent[0] = loadImage("safeContent1.png");  // Images saved in the accompanying 'data' folder
  safeContent[1] = loadImage("safeContent2.png");  // Add new additional images here as needed for the array 
  safeDoor = new Portal();                         // Safe door that moves and drawn above the safe content
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void draw() {
  background(colorDarkTeal);
  
  // Game logic
  clockLockGame.gameState();       // Store and track game state as draw() is called
  clockLockGame.activateGame();    // Initiate game with UI guide and begin interactivity
  
  // Create scene elements
  mainScene.createBkgdCogs();      // Rotating cogs in background
  mainScene.createSafeFrame();     // Static background frame of the safe
  mainScene.createSafeContent();   // Static image depicting inner contents of safe
  safeDoor.create();               // Door to the safe
  
  // Game actions
  clockLockGame.showGameScreen();  // Displays the UI with guide and start/reset buttons
  safeDoor.portalInPlay();         // Initiates the safe door dynamics when game starts
}
