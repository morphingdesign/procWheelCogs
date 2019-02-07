// Class for all bolt construction and animation
class Portal {
  
  Cog[] cogCentral = new Cog[10];  // Single cogs aligned to sketch center
  
  // Class Variables 
  float safeXPos = width/2;
  float safeYPos = height/2;
  float safeShift = 0;
  float xPos;
  float yPos;
  
  
  // *******************************************************
  // Constructor
  
  Portal(){
    // Create central cogs
    cogCentral[0] = new Cog(0, 725, 719, 24, 60, colorWhite, colorWhite, 0, 0);                    // White backdrop
    cogCentral[1] = new Cog(0, 720, 719, 24, 60, colorDarkTan, colorLightTeal, 0, 0);              // Stationary back cog
    cogCentral[2] = new Cog(0, 480, 10, 0, 80, colorDarkBrown, colorDarkBrown, 0, 0);              // Stationary cog
    cogCentral[3] = new Cog(reverseSpeed, 350, 10, 96, 3, colorLightTan, colorDarkBrown, 0, 0);
    cogCentral[4] = new Cog(reverseSpeed, 323, 10, 96, 3, colorDarkBrown, colorDarkBrown, 0, 0);
    cogCentral[5] = new Cog(speed, 228, 10, 48, 3.75, colorLightTan, colorDarkBrown, 0, 0);
    cogCentral[6] = new Cog(speed, 196, 10, 48, 3.75, colorDarkBrown, colorDarkBrown, 0, 0);
    cogCentral[7] = new Cog(reverseSpeed, 135, 10, 48, 2.5, colorLightTan, colorDarkBrown, 0, 0);
    cogCentral[8] = new Cog(reverseSpeed, 107, 10, 48, 2.5, colorDarkBrown, colorDarkBrown, 0, 0);
    cogCentral[9] = new Cog(speed / 4, 68, 30, 24, 2.5, colorLightTan, colorDarkBrown, 0, 0);
  }

  // *******************************************************
  // Portal Class Methods
  
  
  



  void create(){
    // Create central cogs
    // Sorted in array order from background to foreground
    
    for(int i=0; i < cogCentral.length; i++){
       cogCentral[i].centerCog(width/2, height/2);
    }
  }




}
