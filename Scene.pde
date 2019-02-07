// Class for all bolt construction and animation
class Scene {
  
  
  Cog[] cogBkgd = new Cog[4];      // Background pattern of cogs
  
  // Class Variables 
  float safeXPos = width/2;
  float safeYPos = height/2;
  float safeShift = 0;
  float xPos;
  float yPos;

  
  
  // *******************************************************
  // Constructor
  
  Scene(){
    // Create background pattern of rotating cogs
    cogBkgdDiameterOuter = 100;
    cogBkgdDiameterInner = 75;
    int numOfTeeth = 18;  
    cogBkgd[0] = new Cog(speed * 2, cogBkgdDiameterOuter, cogBkgdDiameterInner, numOfTeeth, 5, colorLightBrown, colorDarkTeal, 0, 0);
    cogBkgd[1] = new Cog(speed * 2, int(cogBkgdDiameterOuter * 0.6), int(cogBkgdDiameterInner * 0.6), numOfTeeth, 3, colorLightBrown, colorWhite, 0, 1);
    cogBkgd[2] = new Cog(reverseSpeed * 2, cogBkgdDiameterOuter, cogBkgdDiameterInner, numOfTeeth, 5, colorDarkBrown, colorDarkTeal, radians(5), 0);
    cogBkgd[3] = new Cog(reverseSpeed * 2, int(cogBkgdDiameterOuter * 0.6), int(cogBkgdDiameterInner * 0.6), numOfTeeth, 3, colorDarkBrown, colorWhite, radians(5), 2);
  }

  // *******************************************************
  // Scene Class Methods
  // The following methods each perform separate actions and are sorted in the order of operations
  
  
/**  
  void sceneBkgd(){
    // Create background pattern of rotating cogs
    for(int i=0; i < cogBkgd.length; i++){
       cogBkgd[i].createBkgdCogs(i);
    }
  }
**/

  void sceneBkgd(){
    for(float i = 0; i < width + (cogBkgdDiameterOuter * cos(radians(30))); i += ((cogBkgdDiameterOuter * cos(radians(30))) * 2)){
      for(float j = (cogBkgdDiameterOuter * cos(radians(50))); j < height + (cogBkgdDiameterOuter * cos(radians(30))); j += (cogBkgdDiameterOuter * cos(radians(50))) * 2){
        pushMatrix();
        translate(i, j);        
        cogBkgd[0].rotateCog();
        cogBkgd[1].rotateCog();
        popMatrix();
      }
    } 
    for(float i = ((cogBkgdDiameterOuter * cos(radians(30))) * 1); i < width + (cogBkgdDiameterOuter * cos(radians(30))); i += ((cogBkgdDiameterOuter * cos(radians(30))) * 2)){
      for(float j = 0; j < height + (cogBkgdDiameterOuter * cos(radians(30))); j += (cogBkgdDiameterOuter * cos(radians(50))) * 2){
        pushMatrix();
        translate(i, j);
        cogBkgd[2].rotateCog();
        cogBkgd[3].rotateCog();
        popMatrix();
      }
    }
  }


}
