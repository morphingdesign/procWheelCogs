// Class for all cog construction and animation
class Cog {
  
  // Class Variables
  float safeXPos = width/2;
  float safeYPos = height/2;
  float xPos;
  float yPos;
  float centerXPos;
  float centerYPos;
  float rSpeed;
  int cogDiameterOuter;
  int cogDiameterInner;
  int numOfTeeth;
  float cogTeethProject;
  color cogColor;
  color bkgdColor;
  float rotationOffset;
  float cogOffset = cogDiameterOuter * cos(radians(45));
  int detailOption;  
  
  
  // *******************************************************
  // Constructor
  
  Cog(float speed, int diameterOuter, int diameterInner, int nCogs, float teethProj, color cColor, color bColor, float rOffset, int detailOpt){
    rSpeed = speed;
    cogDiameterOuter = diameterOuter;
    cogDiameterInner = diameterInner;
    numOfTeeth = nCogs;
    cogTeethProject = teethProj;
    cogColor = cColor;
    bkgdColor = bColor;
    rotationOffset = rOffset;
    detailOption = detailOpt;
  }


  // *******************************************************
  // Cog Class Methods
  // The following methods each perform separate actions and are sorted in the order of operations
  
  // *******************************************************
  // Cog basic actions  
  
  void illuminateTimeCog(color lightColor){
    cogColor = lightColor;
  }
  
  void updateCogColor(color updateColor){
    cogColor = updateColor;
  }

  
     
  void selectLightCog(){
    if(mousePressed) {
      openFullSafe = true;
      //cogColor = color(255, 120, 134);
    }  
  }
  
  
  
 
  // Light up cog with a different color 
  void illuminateLockCog(color lightColor, color baseColor){
    if(int(second()) % 2 == 1 && openPartSafe){
      cogColor = lightColor;
    }
    else if(openFullSafe){
      bkgdColor = lightColor;
    }
    else{
      cogColor = baseColor;
    }
 
  }


  // *******************************************************
  // Cog types based on postions throughout sketch

  
  // Create cogs located in center of sketch and in a radial pattern
  void radialCog(float x, float y, float radius, float angle){
    centerXPos = x;
    centerYPos = y;
    xPos = radius * cos(angle);
    yPos = radius * sin(angle);
    pushMatrix();
    //translate(width/2 + xPos, height/2 + yPos);
    translate(centerXPos + xPos, centerYPos + yPos);
    rotateCog();
    popMatrix();
  }
  
  // Create a single cog located in center of sketch
  void centerCog(float x, float y){
    xPos = x;
    yPos = y;
    pushMatrix();
    translate(xPos, yPos);
    rotateCog();
    popMatrix();
  }
  
  
  // *******************************************************
  // Cog basic actions  
  
  // Rotate cog
  void rotateCog(){
    float rotateSpeed = 0;
    if(rSpeed != 0){
      rotateSpeed = (TWO_PI / QUARTER_PI * (second() * (rSpeed)));
    }      
    rotate(radians(rotateSpeed));
    createCog(cogDiameterOuter, cogDiameterInner, numOfTeeth, cogColor, rotationOffset); 
  }


  // *******************************************************
  // Universal cog creation
  
  void createCog(int createCogDiameterOuter, int createCogDiameterInner, int createNumOfTeeth, color createCogColor, float rotationOffset){
    noStroke();
    
    fill(createCogColor);
    pushMatrix();
    
    // Create cog projections
    rectMode(CENTER);
    for(int i = 0; i < (createNumOfTeeth / 2); i++){
      rotate((TWO_PI + rotationOffset) / createNumOfTeeth);
      //rect(0, 0, createCogDiameterOuter / 10, createCogDiameterOuter + 2 * cogTeethProject);  
      rect(0, 0, (createCogDiameterOuter / 2) * (TWO_PI / (createNumOfTeeth * 2)), createCogDiameterOuter + 2 * cogTeethProject);  
    }
     
    // Create center detail circles of wheel
    ellipseMode(CENTER);
    ellipse(0, 0, createCogDiameterOuter, createCogDiameterOuter); // Create central wheel
    fill(bkgdColor);
    ellipse(0, 0, createCogDiameterInner, createCogDiameterInner); 
  
    
    // Detail Options
    if(detailOption == 1){
      createCogDetail(createCogDiameterOuter, 30, createCogColor);
    }
    else if(detailOption == 2){
      createCogDetail(createCogDiameterOuter, 15, createCogColor);
    }
    else{
    }
    
    popMatrix();
  }


  // *******************************************************
  // Cog design detail options
  
  // Cog design detail which includes radial arcs
  void createCogDetail(int diameter, int angle, color createCogColor){
    noStroke();
    fill(createCogColor);
    rotate(radians((angle / 2)));  // Rotate pie to align to axis
    diameter = int(diameter * 0.8);
    
    // Create pie slices
    for(int i = 360; i >= 0; i = i - (2 * angle)){
      int firstAngle = i - angle;
      int secondAngle = i;
      arc(0, 0, diameter, diameter, radians(firstAngle), radians(secondAngle));
    }
    
    // Create inner pie fill circle
    fill(createCogColor);
    ellipse(0, 0, diameter / 2, diameter / 2); 
    
  }

  
}
