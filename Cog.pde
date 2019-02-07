// Class for all cog construction and animation
class Cog {
  
  // Class Variables
  float xPos;
  float yPos;
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
  

  
     
  void selectLightCog(){
    if(mousePressed) {
      cogToggle = true;
      //cogColor = color(255, 120, 134);
    }  
  }
  
  //Code not used
  /**
  int randSelection(int arrayLength){
    int randObject = int(random(1, arrayLength - 1));
    return randObject;
  }
  **/
  
 
  // Light up cog with a different color 
  void illuminateLockCog(color lightColor, color baseColor){
    if(int(second()) % 2 == 1 && openPartSafe){
      cogColor = lightColor;
    }
    else if(cogToggle){
      bkgdColor = lightColor;
    }
    else{
      cogColor = baseColor;
    }
 
  }


  // *******************************************************
  // Cog types based on postions throughout sketch


  // Create columns of background cogs
  void createBkgdCogs(int arrayItem){
    if(arrayItem < 2){
      for(float i = 0; i < width + (cogBkgdDiameterOuter * cos(radians(30))); i += ((cogBkgdDiameterOuter * cos(radians(30))) * 2)){
        for(float j = (cogBkgdDiameterOuter * cos(radians(50))); j < height + (cogBkgdDiameterOuter * cos(radians(30))); j += (cogBkgdDiameterOuter * cos(radians(50))) * 2){
          pushMatrix();
          translate(i, j);        
          rotateCog();
          popMatrix();
        }
      } 
    }
    else{
      for(float i = ((cogBkgdDiameterOuter * cos(radians(30))) * 1); i < width + (cogBkgdDiameterOuter * cos(radians(30))); i += ((cogBkgdDiameterOuter * cos(radians(30))) * 2)){
        for(float j = 0; j < height + (cogBkgdDiameterOuter * cos(radians(30))); j += (cogBkgdDiameterOuter * cos(radians(50))) * 2){
          pushMatrix();
          translate(i, j);
          rotateCog();
          popMatrix();
        }
      }
    }
  }
 
  
  // Create cogs located in center of sketch and in a radial pattern
  void radialCog(float radius, float angle){
    xPos = radius * cos(angle);
    yPos = radius * sin(angle);
    pushMatrix();
    translate(width/2 + xPos, height/2 + yPos);
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
