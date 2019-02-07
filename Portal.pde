// Class for all bolt construction and animation
class Portal {
  
  Cog[] safeDoorCogs = new Cog[7];  // Single cogs aligned to sketch center
  
  Cog[] cogRadialSec = new Cog[12];  // Seconds
  Cog[] cogRadialMin = new Cog[12];  // Minutes
  Cog[] cogRadialHr = new Cog[12];  // Hours
  Cog[] cogRadialOutRing1 = new Cog[24];  // Outer ring 1
  Cog[] cogRadialOutRing2 = new Cog[24];  // Outer ring 2
  Cog[] cogRadialOutRing1Detail = new Cog[24];  // Outer ring 1 inner detail option
  Cog[] cogRadialOutRing2Detail = new Cog[24];  // Outer ring 2 inner detail option
  
  // Class Variables 
  float safeXPos = width/2;
  float safeYPos = height/2;
  //float safeShift = 0;
  //float xPos;
  //float yPos;
  
  
  // *******************************************************
  // Constructor
  
  Portal(){
    // Create central cogs
    //safeDoorCogs[0] = new Cog(0, 725, 719, 24, 60, colorWhite, colorWhite, 0, 0);                    // White backdrop
    //safeDoorCogs[1] = new Cog(0, 720, 719, 24, 60, colorDarkTan, colorLightTeal, 0, 0);              // Stationary back cog
    //safeDoorCogs[2] = new Cog(0, 480, 10, 0, 80, colorDarkBrown, colorDarkBrown, 0, 0);              // Stationary cog
    safeDoorCogs[0] = new Cog(reverseSpeed, 350, 10, 96, 3, colorLightTan, colorDarkBrown, 0, 0);
    safeDoorCogs[1] = new Cog(reverseSpeed, 323, 10, 96, 3, colorDarkBrown, colorDarkBrown, 0, 0);
    safeDoorCogs[2] = new Cog(speed, 228, 10, 48, 3.75, colorLightTan, colorDarkBrown, 0, 0);
    safeDoorCogs[3] = new Cog(speed, 196, 10, 48, 3.75, colorDarkBrown, colorDarkBrown, 0, 0);
    safeDoorCogs[4] = new Cog(reverseSpeed, 135, 10, 48, 2.5, colorLightTan, colorDarkBrown, 0, 0);
    safeDoorCogs[5] = new Cog(reverseSpeed, 107, 10, 48, 2.5, colorDarkBrown, colorDarkBrown, 0, 0);
    safeDoorCogs[6] = new Cog(speed / 4, 68, 30, 24, 2.5, colorLightTan, colorDarkBrown, 0, 0);
    
    // Create central pattern of radial cogs for clock
    for(int i=0; i < cogRadialSec.length; i++){                                                        // Ring for Seconds
       cogRadialSec[i] = new Cog(reverseSpeed * 2, 15, 8, 6, 2.5, colorOrange, colorDarkBrown, 0, 0);  
    }
    for(int i=0; i < cogRadialMin.length; i++){                                                        // Ring for Minutes
       cogRadialMin[i] = new Cog(speed, 25, 17, 6, 2.5, colorOrange, colorDarkBrown, 0, 0);
    }
    for(int i=0; i < cogRadialHr.length; i++){                                                         // Ring for Hours
       cogRadialHr[i] = new Cog(reverseSpeed * 4, 40, 25, 12, 2.5, colorOrange, colorDarkBrown, 0, 0);
    }
    
    // Create central pattern of radial cogs for rings around clock
    for(int i=0; i < cogRadialOutRing1.length; i++){                                                   
       cogRadialOutRing1[i] = new Cog(speed * 4, 30, 22, 12, 2.5, colorOrange, colorDarkBrown, 0, 0);  // Outer ring 1
       cogRadialOutRing1Detail[i] = new Cog(speed * 4, 15, 8, 12, 2.5, colorOrange, colorWhite, 0, 1); // Outer ring 1 detail option
    }
    for(int i=0; i < cogRadialOutRing2.length; i++){                                                   
       cogRadialOutRing2[i] = new Cog(speed * 2, 34, 24, 18, 2.5, colorOrange, colorDarkBrown, 0, 0);  // Outer ring 2
       cogRadialOutRing2Detail[i] = new Cog(speed * 2, 15, 8, 18, 2.5, colorOrange, colorWhite, 0, 2); // Outer ring 2 detail option
    }
    
  }

  // *******************************************************
  // Portal Class Methods

  // Create central pattern of radial cogs used to define the door to the safe
  void create(){
    
    // Create background for safe door
    safeDoorBack();
    
    // Create central cogs
    // Sorted in array order from background to foreground
    for(int i=0; i < safeDoorCogs.length; i++){
       safeDoorCogs[i].centerCog(safeXPos, safeYPos);
    }
    
    
    

  
    // Create ring of cogs for time: Seconds
    float angle = radians(270);
    float radius = 45; 
    for(int i=0; i < cogRadialSec.length; i++){
       cogRadialSec[i].radialCog(radius, angle);
       angle += TWO_PI / cogRadialSec.length;
       int s = second();
       if(i == s/5){
         cogRadialSec[i].illuminateTimeCog(colorLightTeal);
       }
       else{
         cogRadialSec[i].illuminateTimeCog(colorOrange);
       }
    }
    
    // Create ring of cogs for time: Minutes
    radius = 85;
    for(int i=0; i < cogRadialMin.length; i++){
       cogRadialMin[i].radialCog(radius, angle);
       angle += TWO_PI / cogRadialMin.length;
       int m = minute();
       if(i == m/5){
         cogRadialMin[i].illuminateTimeCog(colorLightTeal);
       }
       else{
         cogRadialMin[i].illuminateTimeCog(colorOrange);
       }     
    }
    
    // Create ring of cogs for time: Hours
    radius = 140;
    for(int i=0; i < cogRadialHr.length; i++){
       cogRadialHr[i].radialCog(radius, angle);
       angle += TWO_PI / cogRadialHr.length;
       int h = hour();
       if(h > 12){
         h -= 12;
       }
       if(i == h){
         cogRadialHr[i].illuminateTimeCog(colorLightTeal);
       }
       else{
         cogRadialHr[i].illuminateTimeCog(colorOrange);
       }       
    }
    
    // Create outer rings
    angle = 0;
    for(int i=0; i < cogRadialOutRing1.length; i++){
       cogRadialOutRing1[i].radialCog(195, angle);
       cogRadialOutRing1Detail[i].radialCog(195, angle);
       angle += TWO_PI / cogRadialOutRing1.length;
    }
    angle = 25;
    for(int i=0; i < cogRadialOutRing2.length; i++){
       cogRadialOutRing2[i].radialCog(220, angle);
       cogRadialOutRing2Detail[i].radialCog(220, angle);
       angle += TWO_PI / cogRadialOutRing2.length;
    }
    
    // Illuminate random cogs in the outer ring of cogs
    randCog1 = int(random(0, cogRadialOutRing1.length)); 
    cogRadialOutRing1[randCog1].illuminateLockCog(colorLightTeal, colorOrange);
    randCog2 = int(random(0, cogRadialOutRing2.length)); 
    cogRadialOutRing2[randCog2].illuminateLockCog(colorLightTeal, colorOrange);
    
    
    
    
  }







  void move(){
    for(int i=0; i < safeDoorCogs.length; i++){
      safeXPos += 1; 
      translate(safeXPos, safeYPos);
    }
  }



  void safeDoorBack(){
    noStroke();
    fill(colorLightTeal);
    ellipse(safeXPos, safeYPos, 719, 719); 
    fill(colorDarkBrown);
    ellipse(safeXPos, safeYPos, 480, 480);
  }

}
