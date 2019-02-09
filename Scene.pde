// Class for creating the static background content of the sketch
class Scene {
  
  // Class Arrays
  Cog[] cogBkgd = new Cog[4];      // Background pattern of cogs
  Cog[] safeFrame = new Cog[3];    // Cogs aligned to the center of the sketch used to create the safe
  
  // Class Variables 
  int cogBkgdDiameterOuter = 100;  // Used for consistent size of the background cogs
  int cogBkgdDiameterInner = 75;       
  int numOfTeeth = 18;             // Used for consistent number of teeth in the background cogs
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  
  Scene(){
    // Construct cogs for use in the background pattern
    /** The Cog() function requires the following parameters: Cog(float Speed, int CogDiameterOuter,
        int CogDiameterInner, int NumberOfTeeth, float CogTeethProjection, color MainColor, 
        color InnerColor, float RotationOffset, int DesignOption). RotationOffset is to align adjacent 
        cogs with each other Design options range from 1 - 2; 0 is no design option.
    **/      
    cogBkgd[0] = new Cog(speed * 2, cogBkgdDiameterOuter, cogBkgdDiameterInner, numOfTeeth, 5, colorLightBrown, colorDarkTeal, 0, 0);
    cogBkgd[1] = new Cog(speed * 2, int(cogBkgdDiameterOuter * 0.6), int(cogBkgdDiameterInner * 0.6), numOfTeeth, 3, colorLightBrown, colorWhite, 0, 1);
    cogBkgd[2] = new Cog(reverseSpeed * 2, cogBkgdDiameterOuter, cogBkgdDiameterInner, numOfTeeth, 5, colorDarkBrown, colorDarkTeal, radians(5), 0);
    cogBkgd[3] = new Cog(reverseSpeed * 2, int(cogBkgdDiameterOuter * 0.6), int(cogBkgdDiameterInner * 0.6), numOfTeeth, 3, colorDarkBrown, colorWhite, radians(5), 2);
  
    // Construct cogs for the shape of the safe
    safeFrame[0] = new Cog(0, 725, 719, 24, 60, colorWhite, colorWhite, 0, 0);                    // White backdrop
    safeFrame[1] = new Cog(0, 720, 719, 24, 60, colorDarkTan, colorLightTeal, 0, 0);              // Stationary back cog
    safeFrame[2] = new Cog(0, 480, 10, 0, 80, colorDarkBrown, colorDarkBrown, 0, 0);              // Stationary cog
  }

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // Create background pattern of rotating cogs
  /** Create the columns of rotating cogs serving as the background for the sketch. Each cog is created
      using 2 separate cogs: a large background cog and a smaller inner cog with a variation of details, 
      as defined in its constructor parameter.
  **/
  void createBkgdCogs(){
    for(float i = 0; i < width + (cogBkgdDiameterOuter * cos(radians(30))); i += ((cogBkgdDiameterOuter * cos(radians(30))) * 2)){
      for(float j = (cogBkgdDiameterOuter * cos(radians(50))); j < height + (cogBkgdDiameterOuter * cos(radians(30))); j += (cogBkgdDiameterOuter * cos(radians(50))) * 2){
        pushMatrix();
        translate(i, j);        
        cogBkgd[0].createCog();  // Large outer cog
        cogBkgd[1].createCog();  // Small inner cog with detail
        popMatrix();
      }
    } 
    for(float i = ((cogBkgdDiameterOuter * cos(radians(30))) * 1); i < width + (cogBkgdDiameterOuter * cos(radians(30))); i += ((cogBkgdDiameterOuter * cos(radians(30))) * 2)){
      for(float j = 0; j < height + (cogBkgdDiameterOuter * cos(radians(30))); j += (cogBkgdDiameterOuter * cos(radians(50))) * 2){
        pushMatrix();
        translate(i, j);
        cogBkgd[2].createCog();  // Large outer cog
        cogBkgd[3].createCog();  // Small inner cog with detail
        popMatrix();
      }
    }
  }

  // *******************************************************
  // Create safe frame
  /** Create the frame for the safe using a series of static cogs located in the center of the sketch and 
      serving as a background for the safe contents and safe door.
  **/
  void createSafeFrame(){
    for(int i=0; i < safeFrame.length; i++){
       safeFrame[i].rotateCog(width/2, height/2, 0, 0);
    }
  }

  // *******************************************************
  // Create safe contents
  /** Create content within the opened safe using PNG images located in the accompanying data folder. The 
      safeImageCounter changes with each game reset so that a different image appears each time that the game 
      is played.  Images are loaded into the main setup() function and called within this function. The PNG 
      image format allows for the transparency to hide portions of the image so that only the safe contents 
      appear.
  **/
  void createSafeContent(){
    if(winGame){
      if(safeImageCounter >= safeContent.length){
         safeImageCounter = 0;
      }
      int imageSize = 720;
      pushMatrix();
      translate(width/2, height/2);
      image(safeContent[safeImageCounter], imageSize/-2, imageSize/-2, imageSize, imageSize);
      popMatrix();
    }
  }
}
