Cog[] cogInner = new Cog[3]; //


// Global variables
int cogProject = 10;
color bkgdColor = color(0, 147, 170);
int speed = 1;
color cogColor1 = color(161, 130, 71);
color cogColor2 = color(102, 69, 6);
color cogColor3 = color(255, 211, 129);
color cogColor4 = color(255, 167, 0);
int cogDiameter = 140;
int numOfCogs = 18;   

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

  cogInner[0] = new Cog(speed, cogDiameter, numOfCogs, cogColor1, bkgdColor, 0);
   cogInner[1] = new Cog(speed * -1, cogDiameter, numOfCogs, cogColor2, bkgdColor, radians(5));
   cogInner[2] = new Cog(speed, cogDiameter, numOfCogs, cogColor3, bkgdColor, 0);





// This Works for creating the columns
// Condense this to a class method
    for(float i = 0; i < width + (cogDiameter * cos(radians(30))); i += ((cogDiameter * cos(radians(30))) * 2)){
      for(float j = (cogDiameter * cos(radians(50))); j < height + (cogDiameter * cos(radians(30))); j += (cogDiameter * cos(radians(50))) * 2){
        pushMatrix();
        translate(i, j);
        cogInner[0].rotateCog();
        popMatrix();
      }
    }  
 

    for(float i = ((cogDiameter * cos(radians(30))) * 1); i < width + (cogDiameter * cos(radians(30))); i += ((cogDiameter * cos(radians(30))) * 2)){
      for(float j = 0; j < height + (cogDiameter * cos(radians(30))); j += (cogDiameter * cos(radians(50))) * 2){
        pushMatrix();
        translate(i, j);
        cogInner[1].rotateCog();
        popMatrix();
      }
    }  

  cogInner[2].selectLightCog();
  cogInner[2].centerCog(width/2, height/2);


}
