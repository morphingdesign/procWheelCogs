// Class for all cog construction and animation
class Cog {
  
  // Variables
  float xPos;
  float yPos;
  float rSpeed;
  int cogDiameter;
  int numOfCogs;
  color cogColor;
  color bkgdColor;
  float rotationOffset;
  float cogOffset = cogDiameter * cos(radians(45));
  
  // Constructor
  //Cog(float x, float y, float speed, int diameter, int nCogs, color cColor, float rOffset){
  Cog(float speed, int diameter, int nCogs, color cColor, color bColor, float rOffset){
    //xPos = x;
    //yPos = y;
    rSpeed = speed;
    cogDiameter = diameter;
    numOfCogs = nCogs;
    cogColor = cColor;
    bkgdColor = bColor;
    rotationOffset = rOffset;
  }
  
  void selectLightCog(){
    if(mousePressed) {
      cogToggle = 1;
      cogColor = color(255, 120, 134);
    }  
  }
 
  /**
  // Create a single column of copied cogs
  void createCogColumn(float x, float y){
    //for(float i = x; i < width + cogOffset; i += (cogOffset * 2)){
    //  for(int j = y; j < height + cogDiameter; j += cogDiameter){
    xPos = x;
    yPos = y;
    for(float i = xPos; i < width + cogOffset; i++){
      for(float j = yPos; j < height + cogDiameter; j++){
        pushMatrix();
        translate(i, j);
        this.rotateCog();
        popMatrix();
      }
    }  
  }
  **/
  
  
  void radialCog(float radius, float angle){
    xPos = radius * cos(angle);
    yPos = radius * sin(angle);
    pushMatrix();
    translate(width/2 + xPos, height/2 + yPos);
    rotateCog();
    popMatrix();
  }
  

  void centerCog(float x, float y){
    xPos = x;
    yPos = y;
    pushMatrix();
    translate(xPos, yPos);
    rotateCog();
    popMatrix();
  }
  
  
  void rotateCog(){
    float rotateSpeed = (TWO_PI / QUARTER_PI * (second() / rSpeed));
    //pushMatrix();
    //translate(xPos, yPos);
    rotate(radians(rotateSpeed));
    createCog(cogDiameter, numOfCogs, cogColor, rotationOffset); 
    //popMatrix();
  }
  
  void illuminateCog(){
    /**
    if(second() == 1){
      cogColor = color(255, 120, 134);
    }
    **/
  }
  
  void createCog(int createCogDiameter, int createNumOfCogs, color createCogColor, float rotationOffset){
    noStroke();
    
    fill(createCogColor);
    pushMatrix();
    
    //translate(width/2, height/2);
    // Create cogs on wheel
    rectMode(CENTER);
    
      for(int i = 0; i < (createNumOfCogs / 2); i++){
        rotate((TWO_PI + rotationOffset) / createNumOfCogs);
        rect(0, 0, createCogDiameter / 10, createCogDiameter + 2 * cogProject);  
      }
     
    // Create center detail circles of wheel
    ellipseMode(CENTER);
    ellipse(0, 0, createCogDiameter, createCogDiameter); // Create central wheel
    fill(bkgdColor);
    ellipse(0, 0, createCogDiameter * 0.9, createCogDiameter * 0.9); 
    fill(createCogColor);
    ellipse(0, 0, createCogDiameter * 0.8, createCogDiameter * 0.8); 
    fill(255);
    ellipse(0, 0, createCogDiameter * 0.3, createCogDiameter * 0.3); 
    fill(createCogColor);
    ellipse(0, 0, createCogDiameter * 0.2, createCogDiameter * 0.2);
  
    popMatrix();
  }



  
}
