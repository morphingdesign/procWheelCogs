Cog[] cogInner = new Cog[3]; //
Cog[] cogRadial = new Cog[4]; //

// Global variables
int cogProject = 5;
color bkgdColor = color(0, 147, 170);
int speed = 1;
color cogColor1 = color(161, 130, 71);
color cogColor2 = color(102, 69, 6);
color cogColor3 = color(255, 211, 129);
color cogColor4 = color(255, 167, 0);
int cogBkgdDiameter = 100;
int numOfCogs = 18;   
int cogRingDiameter = 70;

int cogToggle = 0;

void setup() {
   size(1000, 1000);


   
   
   
}

void draw() {
  background(bkgdColor);

  
  /**
  cogInner[0] = new Cog(width/2, height/2, speed, cogDiameter, numOfCogs, cogColor1, 0);
  cogInner[1] = new Cog(width/2 - cogDiameter, height/2 - cogDiameter/3, speed * -1, cogDiameter, numOfCogs, cogColor2, radians(5));
  cogInner[2] = new Cog(width/2 + cogDiameter, height/2 - cogDiameter/3, speed * -1, cogDiameter, numOfCogs, cogColor2, radians(-5));
  **/


  
  //cogInner[1] = new Cog(width/2 - cogDiameter, height/2 - cogDiameter/3, speed * -1, cogDiameter, numOfCogs, cogColor2, radians(5));
  //cogInner[2] = new Cog(width/2 + cogDiameter, height/2 - cogDiameter/3, speed * -1, cogDiameter, numOfCogs, cogColor2, radians(-5));
  //cogInner[0].selectLightCog();
  //cogInner[0].rotateCog();  
  //cogInner[1].rotateCog();
  //cogInner[2].rotateCog();

  cogInner[0] = new Cog(speed, cogBkgdDiameter, numOfCogs, cogColor1, bkgdColor, 0);
  cogInner[1] = new Cog(speed * -1, cogBkgdDiameter, numOfCogs, cogColor2, bkgdColor, radians(5));
  cogInner[2] = new Cog(speed, cogBkgdDiameter, numOfCogs, cogColor3, bkgdColor, 0);



  cogRadial[0] = new Cog(speed, cogRingDiameter, numOfCogs, cogColor3, bkgdColor, 0);
  cogRadial[1] = new Cog(speed, cogRingDiameter, numOfCogs, cogColor3, bkgdColor, 0);



// This Works for creating the columns
// Condense this to a class method
    for(float i = 0; i < width + (cogBkgdDiameter * cos(radians(30))); i += ((cogBkgdDiameter * cos(radians(30))) * 2)){
      for(float j = (cogBkgdDiameter * cos(radians(50))); j < height + (cogBkgdDiameter * cos(radians(30))); j += (cogBkgdDiameter * cos(radians(50))) * 2){
        pushMatrix();
        translate(i, j);
        cogInner[0].rotateCog();
        popMatrix();
      }
    }  
 

    for(float i = ((cogBkgdDiameter * cos(radians(30))) * 1); i < width + (cogBkgdDiameter * cos(radians(30))); i += ((cogBkgdDiameter * cos(radians(30))) * 2)){
      for(float j = 0; j < height + (cogBkgdDiameter * cos(radians(30))); j += (cogBkgdDiameter * cos(radians(50))) * 2){
        pushMatrix();
        translate(i, j);
        cogInner[1].rotateCog();
        popMatrix();
      }
    }  

  cogInner[2].selectLightCog();
  cogInner[2].centerCog(width/2, height/2);

  float radius = 100;
  float angle = 0;

  cogRadial[0].radialCog(radius, angle);
  
  angle =+ PI + HALF_PI;
  angle =+ PI;
  
  cogRadial[1].radialCog(radius, angle);


}




void mousePressed(){
  if(cogToggle == 0){
    cogToggle = 1;
    loop();
  }
  else{
    cogToggle = 0;
    noLoop();
  }
}
