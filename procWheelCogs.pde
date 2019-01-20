// Global variables
int toggleDynamicPattern = 0;  // "0" is off and "1" is on
int cogDiameter = 150;
int cogProject = 10;
int numOfCogs = 16;

void setup() {
   size(500, 500);
   background(152);
   //smooth(4);
   //frameRate(4);
}

void draw() {
  
  pushMatrix();
  translate(width/2, height/2);
  rotateCog();  
  popMatrix();
  
  
}

void rotateCog(){
  float speed = 1;
  color cogColor = color(0, 11, 151);
  float rotateSpeed = TWO_PI / QUARTER_PI * (second() * speed);
  pushMatrix();
  rotate(radians(rotateSpeed));
  createCog(cogDiameter, numOfCogs, cogColor); 
  popMatrix();
}


void createCog(int createCogDiameter, int createNumOfCogs, color createCogColor){
  noStroke();
  fill(createCogColor);
  pushMatrix();
  background(152);
  //translate(width/2, height/2);
  // Create cogs on wheel
  rectMode(CENTER);
  
    for(int i = 0; i < (createNumOfCogs / 2); i++){
      rotate(TWO_PI / createNumOfCogs);
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
