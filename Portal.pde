// Class for creating safe door
class Portal {

  // Class Arrays
  Cog[] safeDoorCogs = new Cog[7];              // Single cogs aligned to sketch center to create safe door
  Cog[] cogRadialSec = new Cog[12];             // Radial array of cogs depicting time in seconds
  Cog[] cogRadialMin = new Cog[12];             // Radial array of cogs depicting time in minutes
  Cog[] cogRadialHr = new Cog[12];              // Radial array of cogs depicting time in hours
  Cog[] cogRadialOutRing1 = new Cog[24];        // Radial array of cogs for outer ring 1
  Cog[] cogRadialOutRing2 = new Cog[24];        // Radial array of cogs for outer ring 2
  Cog[] cogRadialOutRing1Detail = new Cog[24];  // Radial array of cogs for outer ring 1 with inner detail option
  Cog[] cogRadialOutRing2Detail = new Cog[24];  // Radial array of cogs for outer ring 2 with inner detail option
  Bolt[] boltRadial = new Bolt[24];             // Radial array of retractable bolts

  // Class Variables 
  float safeXPos = width/2;
  float safeYPos = height/2;
  int randCog1;
  int randCog2;
  int centerCogDiaOut = 68;
  GameAsset centerCogButton;                    // Used to treat the center cog as a button
  boolean centerCogState = false;               // Defines state for center cog as an interactive button
  boolean retractBolt = true;                   // Sets option for static or retracting bolts
  color brokenCogLight = colorLightTan;
  color brokenCogDark = colorWhite;

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor

  Portal() {
    // Construct cogs in the center of sketch to depict safe door
    /** The Cog() function requires the following parameters: Cog(float Speed, int CogDiameterOuter,
        int CogDiameterInner, int NumberOfTeeth, float CogTeethProjection, color MainColor, 
        color InnerColor, float RotationOffset, int DesignOption). RotationOffset is to align adjacent 
        cogs with each other Design options range from 1 - 2; 0 is no design option.
    **/  
    safeDoorCogs[0] = new Cog(reverseSpeed, 350, 10, 96, 3, colorLightTan, colorDarkBrown, 0, 0);
    safeDoorCogs[1] = new Cog(reverseSpeed, 323, 10, 96, 3, colorDarkBrown, colorDarkBrown, 0, 0);
    safeDoorCogs[2] = new Cog(speed, 228, 10, 48, 3.75, colorLightTan, colorDarkBrown, 0, 0);
    safeDoorCogs[3] = new Cog(speed, 196, 10, 48, 3.75, colorDarkBrown, colorDarkBrown, 0, 0);
    safeDoorCogs[4] = new Cog(reverseSpeed, 135, 10, 48, 2.5, colorLightTan, colorDarkBrown, 0, 0);
    safeDoorCogs[5] = new Cog(reverseSpeed, 107, 10, 48, 2.5, colorDarkBrown, colorDarkBrown, 0, 0);
    safeDoorCogs[6] = new Cog(speed / 4, centerCogDiaOut, 30, 24, 2.5, brokenCogLight, colorDarkBrown, 0, 0);

    // Construct central pattern of radial cogs for clock
    for (int i=0; i < cogRadialSec.length; i++) {                                                        // Ring for seconds
      cogRadialSec[i] = new Cog(reverseSpeed * 2, 15, 8, 6, 2.5, colorOrange, colorDarkBrown, 0, 0);
    }
    for (int i=0; i < cogRadialMin.length; i++) {                                                        // Ring for minutes
      cogRadialMin[i] = new Cog(speed, 25, 17, 6, 2.5, colorOrange, colorDarkBrown, 0, 0);
    }
    for (int i=0; i < cogRadialHr.length; i++) {                                                         // Ring for hours
      cogRadialHr[i] = new Cog(reverseSpeed * 4, 40, 25, 12, 2.5, colorOrange, colorDarkBrown, 0, 0);
    }

    // Construct central pattern of radial cogs for 2 rings around clock
    for (int i=0; i < cogRadialOutRing1.length; i++) {                                                   
      cogRadialOutRing1[i] = new Cog(speed * 4, 30, 22, 12, 2.5, colorOrange, colorDarkBrown, 0, 0);  // Outer ring 1
      cogRadialOutRing1Detail[i] = new Cog(speed * 4, 15, 8, 12, 2.5, colorOrange, colorWhite, 0, 1); // Outer ring 1 detail option
    }
    for (int i=0; i < cogRadialOutRing2.length; i++) {                                                   
      cogRadialOutRing2[i] = new Cog(speed * 2, 34, 24, 18, 2.5, colorOrange, colorDarkBrown, 0, 0);  // Outer ring 2
      cogRadialOutRing2Detail[i] = new Cog(speed * 2, 15, 8, 18, 2.5, colorOrange, colorWhite, 0, 2); // Outer ring 2 detail option
    }

    // Construct ring of retractable bolts
    for (int i=0; i < boltRadial.length; i++) {
      boltRadial[i] = new Bolt();
    }

    // Construct button for center cog
    centerCogButton = new GameAsset();
  }

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods

  // *******************************************************
  // Create geometry depicting the safe door
  void create() {
    
    // Create background for safe door
    noStroke();
    fill(colorLightTeal);
    ellipse(safeXPos, safeYPos, 719, 719); 
    fill(colorDarkBrown);
    ellipse(safeXPos, safeYPos, 480, 480);

    // Create central cogs
    for (int i=0; i < safeDoorCogs.length; i++) {            // For loops sort array order from background to foreground
      safeDoorCogs[i].rotateCog(safeXPos, safeYPos, 0, 0);
    }

    // Create central pattern of radial cogs for clock: Seconds
    float angle = radians(270);                              // Angle rotation to align 0 with the top of the clock
    float radius = 45;                                       // Radius from center of the safe origin
    for (int i=0; i < cogRadialSec.length; i++) {
      cogRadialSec[i].rotateCog(safeXPos, safeYPos, radius, angle);
      angle += TWO_PI / cogRadialSec.length;                 // Rotate origin angle to create next iteraction of cog
      int s = second();
      if (i == s/5) {                                        // Cog color changes when it syncs with sec
        cogRadialSec[i].updateCogColor(colorLightTeal);
      } else {
        cogRadialSec[i].updateCogColor(colorOrange);
      }
    }

    // Create central pattern of radial cogs for clock: Minutes
    radius = 85;                                             // Radius from center of the safe origin
    for (int i=0; i < cogRadialMin.length; i++) {
      cogRadialMin[i].rotateCog(safeXPos, safeYPos, radius, angle);
      angle += TWO_PI / cogRadialMin.length;                 // Rotate origin angle to create next iteraction of cog
      int m = minute();
      if (i == m/5) {                                        // Cog color changes when it syncs with min
        cogRadialMin[i].updateCogColor(colorLightTeal);
      } else {
        cogRadialMin[i].updateCogColor(colorOrange);
      }
    }

    // Create central pattern of radial cogs for clock: Hours
    radius = 140;                                           // Radius from center of the safe origin  
    for (int i=0; i < cogRadialHr.length; i++) {
      cogRadialHr[i].rotateCog(safeXPos, safeYPos, radius, angle);
      angle += TWO_PI / cogRadialHr.length;                 // Rotate origin angle to create next iteraction of cog
      int h = hour();
      if (h > 12) {
        h -= 12;                                           // Convert 24 hr system to 12 hour system
      }
      if (i == h) {                                        // Cog color changes when it syncs with hr
        cogRadialHr[i].updateCogColor(colorLightTeal);
      } else {
        cogRadialHr[i].updateCogColor(colorOrange);
      }
    }

    // Create outer rings
    angle = 0;                                             // Reset angle to align with default radial coordinate of 0
    for (int i=0; i < cogRadialOutRing1.length; i++) {
      cogRadialOutRing1[i].rotateCog(safeXPos, safeYPos, 195, angle);          // Create the innermost of the 2 rings
      cogRadialOutRing1Detail[i].rotateCog(safeXPos, safeYPos, 195, angle);    // Create the inset cog within each larger cog
      angle += TWO_PI / cogRadialOutRing1.length;          // Rotate origin angle to create next iteraction of cog
    }
    angle = 25;                                            // Offset outer ring angle so that cogs align with cogs in inner ring
    for (int i=0; i < cogRadialOutRing2.length; i++) {
      cogRadialOutRing2[i].rotateCog(safeXPos, safeYPos, 220, angle);          // Create the outermost of the 2 rings
      cogRadialOutRing2Detail[i].rotateCog(safeXPos, safeYPos, 220, angle);    // Create the inset cog within each larger cog
      angle += TWO_PI / cogRadialOutRing2.length;          // Rotate origin angle to create next iteraction of cog
    }

    // Illuminate random cogs in the 2 outer rings of cogs so they appear to be blinking sporadically
    randCog1 = int(random(0, cogRadialOutRing1.length));                       // Random number generated from within array length
    cogRadialOutRing1[randCog1].illuminateCog(colorLightTeal, colorOrange);
    randCog2 = int(random(0, cogRadialOutRing2.length)); 
    cogRadialOutRing2[randCog2].illuminateCog(colorLightTeal, colorOrange);

    // Create radial pattern of bolts based on safe door lock/unlock/partial unlock state
    if (openPartSafe) {
      if (openFullSafe) {
        retraction = 0.3;    // Bolts retracted fully to depict fully open safe door
        allBolts();
      } else {
        retraction = 0.6;    // Bolts retracted partially to depict a malfunctioned safe door
        allBolts();
      }
    } else {
      retraction = 0.8;      // Default state of bolts depicting fully locked safe door
      allBolts();
    }
  }

  // *******************************************************
  // Create radial array of bolts
  void allBolts() {  
    float angle = 0;
    for (int i=0; i < boltRadial.length; i++) {
      boltRadial[i].radialBolt(safeXPos, safeYPos, angle, retractBolt);    // Create the rectangle with retraction functionality
      boltRadial[i].radialBolt(safeXPos, safeYPos, angle, !retractBolt);   // Create the base static rectangles for the bolt
      angle += TWO_PI / boltRadial.length;                                 // Rotate origin angle to create next bolt in for loop
    }
  }

  // *******************************************************
  // Manage state of safe door throughout game play
  void portalInPlay() {
    if (startGame) {                          // Conditional to control position of safeDoor after game start
      centerCogButton();                      // Enable center cog button for opening door
      if (winGame) {                          // Conditional to control position of safeDoor only after successful center cog button click
        safeDoorCogs[6].updateCogColor(brokenCogLight);    // Reset center cog color back to its base default color
        for (int i=0; i < safeDoorCogs.length; i++) {
          if (resetGame) {
            safeXPos = width/2;               // Reset safe door back to its original position
          }
          else{
            safeXPos += 1;                    // Move safe door from origin to the right
          }
        }
        translate(safeXPos, safeYPos);  
      }
    }
  }

  // *******************************************************
  // Define state of center cog when enabled as a button
  void centerCogButton() {
    updateCenterCogState(int(safeXPos - centerCogDiaOut/2), int(safeYPos - centerCogDiaOut/2), centerCogDiaOut, centerCogDiaOut);
    if (centerCogState) {                                // Reads state of boolean when mouse hovers over center cog
      safeDoorCogs[6].updateCogColor(colorLightTeal);    // Highlights cog color when mouse hovers over center cog
      if (mousePressed) {                                // State of winGame and cog color when mouse is clicked over cog
        winGame = true;                                  // Declares game state of successful completion 
        safeDoorCogs[6].updateCogColor(colorBlack);
      }
    } else {                                             
      safeDoorCogs[6].illuminateCog(brokenCogDark, brokenCogLight);    // Center cog changes color to appear blinking 
    }
  }

  // *******************************************************
  // Method using a boolean to identify if mouse is hovering over its geometry
  void updateCenterCogState(int bX, int bY, int bW, int bH) {
    if (centerCogButton.hoverButton(bX, bY, bW, bH)) {    // Uses Game().hoverButton method to modify state of boolean for mouse hover
      centerCogState = true;
    } else {
      centerCogState = false;
    }
  }
}
