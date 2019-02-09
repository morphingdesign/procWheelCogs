// Class for creating safe door
class Portal {

  // Class Arrays
  Cog[] safeDoorCogs = new Cog[7];  // Single cogs aligned to sketch center
  Cog[] cogRadialSec = new Cog[12];  // Seconds
  Cog[] cogRadialMin = new Cog[12];  // Minutes
  Cog[] cogRadialHr = new Cog[12];  // Hours
  Cog[] cogRadialOutRing1 = new Cog[24];  // Outer ring 1
  Cog[] cogRadialOutRing2 = new Cog[24];  // Outer ring 2
  Cog[] cogRadialOutRing1Detail = new Cog[24];  // Outer ring 1 inner detail option
  Cog[] cogRadialOutRing2Detail = new Cog[24];  // Outer ring 2 inner detail option
  Bolt[] boltRadial = new Bolt[24]; // Ring of retractable bolts

  // Class Variables 
  float safeXPos = width/2;
  float safeYPos = height/2;
  int randCog1;
  int randCog2;
  int centerCogDiaOut = 68;
  GameAsset centerCogButton;
  boolean centerCogState = false;
  boolean retractBolt = true;            // Sets option for static or retracting bolts
  color brokenCogLight = colorLightTan;
  color brokenCogDark = colorWhite;

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor

  Portal() {
    // Create central cogs
    // The new Cog() function requires the following parameters: Cog(float Speed, int CogDiameterOuter, int CogDiameterInner, 
    // int NumberOfTeeth, float CogTeethProjection, color MainColor, color InnerColor, float RotationOffset, int DesignOption) 
    // RotationOffset is to align adjacent cogs with each other Design options range from 1 - 2; 0 is no design option
    safeDoorCogs[0] = new Cog(reverseSpeed, 350, 10, 96, 3, colorLightTan, colorDarkBrown, 0, 0);
    safeDoorCogs[1] = new Cog(reverseSpeed, 323, 10, 96, 3, colorDarkBrown, colorDarkBrown, 0, 0);
    safeDoorCogs[2] = new Cog(speed, 228, 10, 48, 3.75, colorLightTan, colorDarkBrown, 0, 0);
    safeDoorCogs[3] = new Cog(speed, 196, 10, 48, 3.75, colorDarkBrown, colorDarkBrown, 0, 0);
    safeDoorCogs[4] = new Cog(reverseSpeed, 135, 10, 48, 2.5, colorLightTan, colorDarkBrown, 0, 0);
    safeDoorCogs[5] = new Cog(reverseSpeed, 107, 10, 48, 2.5, colorDarkBrown, colorDarkBrown, 0, 0);
    safeDoorCogs[6] = new Cog(speed / 4, centerCogDiaOut, 30, 24, 2.5, brokenCogLight, colorDarkBrown, 0, 0);

    // Create central pattern of radial cogs for clock
    for (int i=0; i < cogRadialSec.length; i++) {                                                        // Ring for Seconds
      cogRadialSec[i] = new Cog(reverseSpeed * 2, 15, 8, 6, 2.5, colorOrange, colorDarkBrown, 0, 0);
    }
    for (int i=0; i < cogRadialMin.length; i++) {                                                        // Ring for Minutes
      cogRadialMin[i] = new Cog(speed, 25, 17, 6, 2.5, colorOrange, colorDarkBrown, 0, 0);
    }
    for (int i=0; i < cogRadialHr.length; i++) {                                                         // Ring for Hours
      cogRadialHr[i] = new Cog(reverseSpeed * 4, 40, 25, 12, 2.5, colorOrange, colorDarkBrown, 0, 0);
    }

    // Create central pattern of radial cogs for rings around clock
    for (int i=0; i < cogRadialOutRing1.length; i++) {                                                   
      cogRadialOutRing1[i] = new Cog(speed * 4, 30, 22, 12, 2.5, colorOrange, colorDarkBrown, 0, 0);  // Outer ring 1
      cogRadialOutRing1Detail[i] = new Cog(speed * 4, 15, 8, 12, 2.5, colorOrange, colorWhite, 0, 1); // Outer ring 1 detail option
    }
    for (int i=0; i < cogRadialOutRing2.length; i++) {                                                   
      cogRadialOutRing2[i] = new Cog(speed * 2, 34, 24, 18, 2.5, colorOrange, colorDarkBrown, 0, 0);  // Outer ring 2
      cogRadialOutRing2Detail[i] = new Cog(speed * 2, 15, 8, 18, 2.5, colorOrange, colorWhite, 0, 2); // Outer ring 2 detail option
    }

    // Create ring of retractable bolts
    for (int i=0; i < boltRadial.length; i++) {
      boltRadial[i] = new Bolt();
    }

    // Create button for center cog
    centerCogButton = new GameAsset();

    /**
     for(int i=0; i < brokenCogState.length; i++){
     brokenCogState[i] = false;
     }
     **/
  }

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods

  // *******************************************************
  // Create safe door portal geometry
  void create() {

    // Create background for safe door
    noStroke();
    fill(colorLightTeal);
    ellipse(safeXPos, safeYPos, 719, 719); 
    fill(colorDarkBrown);
    ellipse(safeXPos, safeYPos, 480, 480);

    // Create central cogs
    for (int i=0; i < safeDoorCogs.length; i++) {            // For loops sorts array order from background to foreground
      safeDoorCogs[i].rotateCog(safeXPos, safeYPos, 0, 0);
    }

    // Create ring of cogs for time: Seconds
    float angle = radians(270);
    float radius = 45; 
    for (int i=0; i < cogRadialSec.length; i++) {
      cogRadialSec[i].rotateCog(safeXPos, safeYPos, radius, angle);
      angle += TWO_PI / cogRadialSec.length;
      int s = second();
      if (i == s/5) {                                        // Cog color changes when it syncs with sec
        cogRadialSec[i].illuminateTimeCog(colorLightTeal);
      } else {
        cogRadialSec[i].illuminateTimeCog(colorOrange);
      }
    }

    // Create ring of cogs for time: Minutes
    radius = 85;
    for (int i=0; i < cogRadialMin.length; i++) {
      cogRadialMin[i].rotateCog(safeXPos, safeYPos, radius, angle);
      angle += TWO_PI / cogRadialMin.length;
      int m = minute();
      if (i == m/5) {                                        // Cog color changes when it syncs with min
        cogRadialMin[i].illuminateTimeCog(colorLightTeal);
      } else {
        cogRadialMin[i].illuminateTimeCog(colorOrange);
      }
    }

    // Create ring of cogs for time: Hours
    radius = 140;
    for (int i=0; i < cogRadialHr.length; i++) {
      cogRadialHr[i].rotateCog(safeXPos, safeYPos, radius, angle);
      angle += TWO_PI / cogRadialHr.length;
      int h = hour();
      if (h > 12) {
        h -= 12;
      }
      if (i == h) {                                        // Cog color changes when it syncs with hr
        cogRadialHr[i].illuminateTimeCog(colorLightTeal);
      } else {
        cogRadialHr[i].illuminateTimeCog(colorOrange);
      }
    }

    // Create outer rings
    angle = 0;
    for (int i=0; i < cogRadialOutRing1.length; i++) {
      cogRadialOutRing1[i].rotateCog(safeXPos, safeYPos, 195, angle);
      cogRadialOutRing1Detail[i].rotateCog(safeXPos, safeYPos, 195, angle);
      angle += TWO_PI / cogRadialOutRing1.length;
    }
    angle = 25;
    for (int i=0; i < cogRadialOutRing2.length; i++) {
      cogRadialOutRing2[i].rotateCog(safeXPos, safeYPos, 220, angle);
      cogRadialOutRing2Detail[i].rotateCog(safeXPos, safeYPos, 220, angle);
      angle += TWO_PI / cogRadialOutRing2.length;
    }

    // Illuminate random cogs in the outer ring of cogs
    randCog1 = int(random(0, cogRadialOutRing1.length)); 
    cogRadialOutRing1[randCog1].illuminateOrbitCog(colorLightTeal, colorOrange);
    randCog2 = int(random(0, cogRadialOutRing2.length)); 
    cogRadialOutRing2[randCog2].illuminateOrbitCog(colorLightTeal, colorOrange);

    // Create radial pattern of bolts  
    activateBolts();
  }


  // *******************************************************
  // Bolt basic actions  
  void activateBolts() {
    if (openPartSafe) {
      if (openFullSafe) {
        retraction = 0.3;
        allBolts();
      } else {
        retraction = 0.6;
        allBolts();
      }
    } else {
      //lockBolts();
      retraction = 0.8;
      allBolts();
    }
  }

  // *******************************************************
/**
  void lockBolts() {
    retraction = 0.8;
    allBolts();
  }
**/
  // *******************************************************

  void allBolts() {  
    float angle = 0;
    for (int i=0; i < boltRadial.length; i++) {
      boltRadial[i].radialBolt(safeXPos, safeYPos, angle, retractBolt);
      boltRadial[i].radialBolt(safeXPos, safeYPos, angle, !retractBolt);
      angle += TWO_PI / boltRadial.length;
    }
  }

  // *******************************************************

  void portalInPlay() {
    if (startGame) {
      cogButtons();
      portalPosition();
    }
  }

  // *******************************************************
  // Control position of portal
  void portalPosition() {
    if (winGame) {
      if (resetGame) {
        resetPortal();
      } else {
        movePortal();
      }
    } else {
    }
  }

  // *******************************************************

  void movePortal() {
    safeDoorCogs[6].updateCogColor(brokenCogLight);
    for (int i=0; i < safeDoorCogs.length; i++) {
      safeXPos += 1; 
      translate(safeXPos, safeYPos);
    }
  }

  // *******************************************************

  void resetPortal() {
    safeDoorCogs[6].updateCogColor(brokenCogLight);
    for (int i=0; i < safeDoorCogs.length; i++) {
      safeXPos = width/2; 
      translate(safeXPos, safeYPos);
      //lockBolts();
      //activateBolts();
    }
  }

  // *******************************************************

  void cogButtons() {
    updateCenterCogState(int(safeXPos - centerCogDiaOut/2), int(safeYPos - centerCogDiaOut/2), centerCogDiaOut, centerCogDiaOut);
    if (startGame) {
      if (centerCogState) {
        safeDoorCogs[6].updateCogColor(colorLightTeal);
        if (mousePressed) {
          winGame = true;
          safeDoorCogs[6].updateCogColor(colorBlack);
        }
      } else {
        safeDoorCogs[6].illuminateCenterCog(brokenCogDark, brokenCogLight);
      }
    }
  }

  // *******************************************************

  void updateCenterCogState(int bX, int bY, int bW, int bH) {
    if (centerCogButton.hoverButton(bX, bY, bW, bH)) {
      centerCogState = true;
    } else {
      centerCogState = false;
    }
  }
}
