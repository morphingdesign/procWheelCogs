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
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  
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


  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // Cog basic actions  
  void illuminateTimeCog(color lightColor){
    cogColor = lightColor;
  }
  
  // *******************************************************
  
  void updateCogColor(color updateColor){
    cogColor = updateColor;
  }
  
  // *******************************************************
  // Light up cog with a different color 
  void illuminateCenterCog(color lightColor, color baseColor){
    if(int(second()) % 2 == 1){
      cogColor = lightColor;
    }
    else if(cogSelected){
      bkgdColor = lightColor;
    }
    else{
      cogColor = baseColor;
    }
  }
 
  // *******************************************************
  // Light up cog with a different color 
  void illuminateOrbitCog(color lightColor, color baseColor){
    if(int(second()) % 2 == 1 && openPartSafe){
      cogColor = lightColor;
    }
    else if(cogSelected){
      bkgdColor = lightColor;
    }
    else{
      cogColor = baseColor;
    }
 
  }


  // *******************************************************
  // Cog types based on postions throughout sketch


  void rotateCog(float x, float y, float radius, float angle){
    centerXPos = x;
    centerYPos = y;
    xPos = radius * cos(angle);
    yPos = radius * sin(angle);
    pushMatrix();
    translate(centerXPos + xPos, centerYPos + yPos);
    createCog();
    popMatrix(); 
  }

/**
  // *******************************************************
  // Create cogs located in center of sketch and in a radial pattern
  void radialCog(float x, float y, float radius, float angle){
    centerXPos = x;
    centerYPos = y;
    xPos = radius * cos(angle);
    yPos = radius * sin(angle);
    pushMatrix();
    translate(centerXPos + xPos, centerYPos + yPos);
    createCog();
    popMatrix();
  }
  
  // *******************************************************
  // Create a single rotating cog located in center of sketch
  void centerCog(float x, float y){
    xPos = x;
    yPos = y;
    pushMatrix();
    translate(xPos, yPos);
    createCog();
    popMatrix();
  }  
**/  
  
  
  
  // *******************************************************
  // Basic cog creation
  /** This function is a significant building block for use in creating a wide variety
      of static or rotating cogs based on size, teeth, color, and any applicable detail option.
  **/  
  void createCog(){
    float rotateSpeed = 0;
    if(rSpeed != 0){                                              
      rotateSpeed = (TWO_PI / QUARTER_PI * (second() * (rSpeed)));
    }      
    rotate(radians(rotateSpeed));                                     // Dynamic rotation initiated, if applicable
    noStroke();
    fill(cogColor);
    pushMatrix();
    rectMode(CENTER);                                                 // Create cog teeth
    for(int i = 0; i < (numOfTeeth / 2); i++){
      rotate((TWO_PI + rotationOffset) / numOfTeeth);
      rect(0, 0, (cogDiameterOuter / 2) * (TWO_PI / (numOfTeeth * 2)), cogDiameterOuter + 2 * cogTeethProject);  
    }
    ellipseMode(CENTER);                                              // Create center detail circles of wheel
    ellipse(0, 0, cogDiameterOuter, cogDiameterOuter);    
    fill(bkgdColor);
    ellipse(0, 0, cogDiameterInner, cogDiameterInner);    
    if(detailOption == 1){                                            // Specify which of the 2 detail options is applied, if any
      createCogDetail(cogDiameterOuter, 30, cogColor);
    }
    else if(detailOption == 2){
      createCogDetail(cogDiameterOuter, 15, cogColor);
    }
    else{
    }
    popMatrix();
  }
  
  // ******************************************************* 
  // Create cog design detail options of radial arcs
  void createCogDetail(int diameter, int angle, color createCogColor){
    noStroke();
    fill(createCogColor);
    rotate(radians((angle / 2)));                                                  // Rotate pie to align to axis
    diameter = int(diameter * 0.8);
    for(int i = 360; i >= 0; i = i - (2 * angle)){
      int firstAngle = i - angle;
      int secondAngle = i;
      arc(0, 0, diameter, diameter, radians(firstAngle), radians(secondAngle));    // Create pie slices
    }
    fill(createCogColor);
    ellipse(0, 0, diameter / 2, diameter / 2);                                     // Create inner pie fill circle
  }
}
