// Global variables
int toggleDynamicPattern = 0;  // "0" is off and "1" is on
int cogProject = 10;

void setup() {
   size(500, 500);
}

void draw() {
  background(152);
  int speed = 1;
  color cogColor1 = color(0, 11, 151);
  color cogColor2 = color(153, 0, 0);
  int cogDiameter = 150;
  int numOfCogs = 16;
  

  rotateCog(width/2, height/2, speed, cogDiameter, numOfCogs, cogColor1, 0);  
  rotateCog(width/2 - cogDiameter, height/2 - cogDiameter/3, speed * -1, cogDiameter, numOfCogs, cogColor2, radians(5));
  rotateCog(width/2 + cogDiameter, height/2 - cogDiameter/3, speed * -1, cogDiameter, numOfCogs, cogColor2, radians(-5));

  
  
}

void rotateCog(float xPos, float yPos, float speed, int cogDiameter, int numOfCogs, color cogColor, float rotationOffset){
  
  float rotateSpeed = TWO_PI / QUARTER_PI * (second() * speed);
  pushMatrix();
  translate(xPos, yPos);
  rotate(radians(rotateSpeed));
  createCog(cogDiameter, numOfCogs, cogColor, rotationOffset); 
  popMatrix();
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
  fill(151);
  ellipse(0, 0, createCogDiameter * 0.9, createCogDiameter * 0.9); 
  fill(createCogColor);
  ellipse(0, 0, createCogDiameter * 0.8, createCogDiameter * 0.8); 
  fill(151);
  ellipse(0, 0, createCogDiameter * 0.3, createCogDiameter * 0.3); 
  fill(createCogColor);
  ellipse(0, 0, createCogDiameter * 0.2, createCogDiameter * 0.2);

  popMatrix();
}
