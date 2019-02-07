// Class for all bolt construction and animation
class Scene {
  
  // Arrays
  Cog[] cogBkgd = new Cog[4];    // Background pattern of cogs
  Cog[] safeFrame = new Cog[3];  // Single cogs aligned to sketch center
  
  // Class Variables 
  int cogBkgdDiameterOuter;
  int cogBkgdDiameterInner;

  
  // *******************************************************
  // Constructor
  
  Scene(){
    // Create background pattern of rotating cogs
    // The new Cog() function requires the following parameters: Cog(float Speed, int CogDiameterOuter, int CogDiameterOuter, 
    // int NumberOfTeeth, float CogTeethProjection, color MainColor, color InnerColor, float RotationOffset, int DesignOption) 
    // RotationOffset is to align adjacent cogs with each other Design options range from 1 - 2; 0 is no design option
    cogBkgdDiameterOuter = 100;
    cogBkgdDiameterInner = 75;
    int numOfTeeth = 18;  
    cogBkgd[0] = new Cog(speed * 2, cogBkgdDiameterOuter, cogBkgdDiameterInner, numOfTeeth, 5, colorLightBrown, colorDarkTeal, 0, 0);
    cogBkgd[1] = new Cog(speed * 2, int(cogBkgdDiameterOuter * 0.6), int(cogBkgdDiameterInner * 0.6), numOfTeeth, 3, colorLightBrown, colorWhite, 0, 1);
    cogBkgd[2] = new Cog(reverseSpeed * 2, cogBkgdDiameterOuter, cogBkgdDiameterInner, numOfTeeth, 5, colorDarkBrown, colorDarkTeal, radians(5), 0);
    cogBkgd[3] = new Cog(reverseSpeed * 2, int(cogBkgdDiameterOuter * 0.6), int(cogBkgdDiameterInner * 0.6), numOfTeeth, 3, colorDarkBrown, colorWhite, radians(5), 2);
  
    // Create central cogs
    safeFrame[0] = new Cog(0, 725, 719, 24, 60, colorWhite, colorWhite, 0, 0);                    // White backdrop
    safeFrame[1] = new Cog(0, 720, 719, 24, 60, colorDarkTan, colorLightTeal, 0, 0);              // Stationary back cog
    safeFrame[2] = new Cog(0, 480, 10, 0, 80, colorDarkBrown, colorDarkBrown, 0, 0);              // Stationary cog
  }

  // *******************************************************
  // Scene Class Methods
  

  void createBkgdCogs(){
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



  void createSafeFrame(){
    for(int i=0; i < safeFrame.length; i++){
       safeFrame[i].centerCog(width/2, height/2);
    }
  }

}
