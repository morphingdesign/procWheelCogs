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
// Array declarations

/**
Cog[] cogRadialSec = new Cog[12];  // Seconds
Cog[] cogRadialMin = new Cog[12];  // Minutes
Cog[] cogRadialHr = new Cog[12];  // Hours
Cog[] cogRadialOutRing1 = new Cog[24];  // Outer ring 1
Cog[] cogRadialOutRing2 = new Cog[24];  // Outer ring 2
Cog[] cogRadialOutRing1Detail = new Cog[24];  // Outer ring 1 inner detail option
Cog[] cogRadialOutRing2Detail = new Cog[24];  // Outer ring 2 inner detail option
**/

Bolt[] boltRadial = new Bolt[24]; // Ring of retractable bolts

Scene mainScene;
Portal safeDoor;
Game clockLockGame;

// *******************************************************
// Global variables

float speed = 1;
float reverseSpeed = speed * -1;
float safeXPos = width/2;
float safeYPos = height/2;
float safeShift = 0;
float xPos;
float yPos;

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

// *******************************************************
// Begin setup() function

void setup() {
   size(1000, 1000);

  // The new Cog() function requires the following parameters: Cog(float Speed, int CogDiameterOuter, int CogDiameterOuter, 
  // int NumberOfTeeth, float CogTeethProjection, color MainColor, color InnerColor, float RotationOffset, int DesignOption) 
  // RotationOffset is to align adjacent cogs with each other Design options range from 1 - 2; 0 is no design option
  
  mainScene = new Scene();
  safeDoor = new Portal();
  clockLockGame = new Game();

/**
  // Create central pattern of radial cogs for clock
  for(int i=0; i < cogRadialSec.length; i++){                                                        // Ring for Seconds
     cogRadialSec[i] = new Cog(reverseSpeed * 2, 15, 8, 6, 2.5, colorOrange, colorDarkBrown, 0, 0);  
  }
  for(int i=0; i < cogRadialMin.length; i++){                                                        // Ring for Minutes
     cogRadialMin[i] = new Cog(speed, 25, 17, 6, 2.5, colorOrange, colorDarkBrown, 0, 0);
  }
  for(int i=0; i < cogRadialHr.length; i++){                                                         // Ring for Hours
     cogRadialHr[i] = new Cog(reverseSpeed * 4, 40, 25, 12, 2.5, colorOrange, colorDarkBrown, 0, 0);
  }
  
  // Create central pattern of radial cogs for rings around clock
  for(int i=0; i < cogRadialOutRing1.length; i++){                                                   
     cogRadialOutRing1[i] = new Cog(speed * 4, 30, 22, 12, 2.5, colorOrange, colorDarkBrown, 0, 0);  // Outer ring 1
     cogRadialOutRing1Detail[i] = new Cog(speed * 4, 15, 8, 12, 2.5, colorOrange, colorWhite, 0, 1); // Outer ring 1 detail option
  }
  for(int i=0; i < cogRadialOutRing2.length; i++){                                                   
     cogRadialOutRing2[i] = new Cog(speed * 2, 34, 24, 18, 2.5, colorOrange, colorDarkBrown, 0, 0);  // Outer ring 2
     cogRadialOutRing2Detail[i] = new Cog(speed * 2, 15, 8, 18, 2.5, colorOrange, colorWhite, 0, 2); // Outer ring 2 detail option
  }
**/


  // Create ring of retractable bolts
  for(int i=0; i < boltRadial.length; i++){
     boltRadial[i] = new Bolt();
  }

  
}

// End setup() function
// *******************************************************


// *******************************************************
// Start draw() function

void draw() {
  background(colorDarkTeal);

  // *******************************************************
  // Initiate game and interactivity
  mainScene.createBkgdCogs();
  mainScene.createSafeFrame();
  safeDoor.create();
  
  //safeDoor.move();
  clockLockGame.gameStart(); 

/**
  // *******************************************************
  // Create central pattern of radial cogs used to define the door to the safe

  
  // Create ring of cogs for time: Seconds
  float angle = radians(270);
  float radius = 45; 
  for(int i=0; i < cogRadialSec.length; i++){
     cogRadialSec[i].radialCog(radius, angle);
     angle += TWO_PI / cogRadialSec.length;
     int s = second();
     if(i == s/5){
       cogRadialSec[i].illuminateTimeCog(colorLightTeal);
     }
     else{
       cogRadialSec[i].illuminateTimeCog(colorOrange);
     }
  }
  
  // Create ring of cogs for time: Minutes
  radius = 85;
  for(int i=0; i < cogRadialMin.length; i++){
     cogRadialMin[i].radialCog(radius, angle);
     angle += TWO_PI / cogRadialMin.length;
     int m = minute();
     if(i == m/5){
       cogRadialMin[i].illuminateTimeCog(colorLightTeal);
     }
     else{
       cogRadialMin[i].illuminateTimeCog(colorOrange);
     }     
  }
  
  // Create ring of cogs for time: Hours
  radius = 140;
  for(int i=0; i < cogRadialHr.length; i++){
     cogRadialHr[i].radialCog(radius, angle);
     angle += TWO_PI / cogRadialHr.length;
     int h = hour();
     if(h > 12){
       h -= 12;
     }
     if(i == h){
       cogRadialHr[i].illuminateTimeCog(colorLightTeal);
     }
     else{
       cogRadialHr[i].illuminateTimeCog(colorOrange);
     }       
  }
  
  // Create outer rings
  angle = 0;
  for(int i=0; i < cogRadialOutRing1.length; i++){
     cogRadialOutRing1[i].radialCog(195, angle);
     cogRadialOutRing1Detail[i].radialCog(195, angle);
     angle += TWO_PI / cogRadialOutRing1.length;
  }
  angle = 25;
  for(int i=0; i < cogRadialOutRing2.length; i++){
     cogRadialOutRing2[i].radialCog(220, angle);
     cogRadialOutRing2Detail[i].radialCog(220, angle);
     angle += TWO_PI / cogRadialOutRing2.length;
  }
  
  // Illuminate random cogs in the outer ring of cogs
  randCog1 = int(random(0, cogRadialOutRing1.length)); 
  cogRadialOutRing1[randCog1].illuminateLockCog(colorLightTeal, colorOrange);
  randCog2 = int(random(0, cogRadialOutRing2.length)); 
  cogRadialOutRing2[randCog2].illuminateLockCog(colorLightTeal, colorOrange);
  
  
**/  

  // *******************************************************
  // Create radial pattern of bolts  
  for(Bolt b : boltRadial){
     b.boltPosition();
     b.activateBolts();
  }
   
   
  
    
}


// End draw() function
// *******************************************************




// *******************************************************
// Interactivity Functions
