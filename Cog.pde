// Class for all cog construction and animation
class Cog {
  
  // Class Variables
  float rSpeed;               // Specifies the rotation speed for each individual cog
  int cogDiameterOuter;       // With the many variations of cogs, each can be defined with
  int cogDiameterInner;       // these diameter and teeth variables
  int numOfTeeth;
  float cogTeethProject;      // Defines how far the teeth project beyond the cog diameter
  color cogColor;             // Main color for the cog
  color bkgdColor;            // Color used to fill in the internal ellipse within each cog
  float rotationOffset;       // Variable used to offset the rotation angle so that adjacent cogs' teeth align
  int detailOption;           // Variable used to define which of the detail options applied to cog
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // Used to construct an instance of the Cog object.  The parameters passed through define the type of cog and its behavior
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
  // Change cog color  
  void updateCogColor(color updateColor){
    cogColor = updateColor;
  }
  
  // *******************************************************
  // Change cog color at periodic intervals to appear blinking
  void illuminateCog(color lightColor, color baseColor){
    if(int(second()) % 2 == 1){
      cogColor = lightColor;      // Color that cog changes to 
    }
    else{
      cogColor = baseColor;       // Color that cog reverts to
    }
  }  

  // *******************************************************
  // Create cog based on unique origin and polar coordinates in sketch and rotation criteria
  void rotateCog(float x, float y, float radius, float angle){
    float centerXPos = x;                                            
    float centerYPos = y;
    float xPos = radius * cos(angle);
    float yPos = radius * sin(angle);
    pushMatrix();
    translate(centerXPos + xPos, centerYPos + yPos);    // Define new origin based on input parameters
    createCog();                                        // Create a single cog based on new origin
    popMatrix(); 
  }
  
  // *******************************************************
  // Basic building block for use in creating a wide variety of static or rotating cogs based 
  // on size, teeth, color, and any applicable detail option.
  void createCog(){
    float rotateSpeed = 0;
    if(rSpeed != 0){                                              
      rotateSpeed = (TWO_PI / QUARTER_PI * (second() * (rSpeed)));
    }      
    rotate(radians(rotateSpeed));                       // Dynamic rotation initiated, if applicable
    noStroke();
    fill(cogColor);
    pushMatrix();
    rectMode(CENTER);                                   // Create cog teeth
    for(int i = 0; i < (numOfTeeth / 2); i++){
      rotate((TWO_PI + rotationOffset) / numOfTeeth);
      rect(0, 0, (cogDiameterOuter / 2) * (TWO_PI / (numOfTeeth * 2)), cogDiameterOuter + 2 * cogTeethProject);  
    }
    ellipseMode(CENTER);                                // Create center detail circles of wheel
    ellipse(0, 0, cogDiameterOuter, cogDiameterOuter);    
    fill(bkgdColor);
    ellipse(0, 0, cogDiameterInner, cogDiameterInner);    
    if(detailOption == 1){                              // Specify which of the 2 detail options is applied, if any
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
    rotate(radians((angle / 2)));                       // Rotate pie to align to axis
    diameter = int(diameter * 0.8);
    for(int i = 360; i >= 0; i = i - (2 * angle)){
      int firstAngle = i - angle;
      int secondAngle = i;
      arc(0, 0, diameter, diameter, radians(firstAngle), radians(secondAngle));    // Create pie slices
    }
    fill(createCogColor);
    ellipse(0, 0, diameter / 2, diameter / 2);          // Create inner pie fill circle
  }
}
