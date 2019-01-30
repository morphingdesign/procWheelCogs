

Cog[] cogBkgd = new Cog[4];      // Background pattern of cogs
Cog[] cogCentral = new Cog[10];  // Single cogs aligned to sketch center
Cog[] cogRadial1 = new Cog[12];  // Seconds
Cog[] cogRadial2 = new Cog[12];  // Minutes
Cog[] cogRadial3 = new Cog[12];  // Hours
Cog[] cogRadial4 = new Cog[24];  // Outer ring 1
Cog[] cogRadial5 = new Cog[24];  // Outer ring 2
Cog[] cogRadial6 = new Cog[24];  // Outer ring 1 inner detail option
Cog[] cogRadial7 = new Cog[24];  // Outer ring 2 inner detail option

// *******************************************************
// Global variables

float speed = 1;
float reverseSpeed = speed * -1;
int cogBkgdDiameterOuter;
int cogBkgdDiameterInner;
int numOfTeeth;   

// Colors
color colorWhite = color(255, 255, 255);
color colorDarkTeal = color(0, 147, 170);
color colorLightTeal = color(51, 182, 203);
color colorDarkBrown = color(102, 69, 6);
color colorLightBrown = color(161, 130, 71);
color colorLightTan = color(255, 211, 129);
color colorDarkTan = color(129, 84, 0);
color colorOrange = color(255, 167, 0);

// Interactivity toggles
int cogToggle = 0;

// *******************************************************

void setup() {
   size(1000, 1000);

  // The new Cog() function requires the following parameters:
  // Cog(float Speed, int CogDiameterOuter, int CogDiameterOuter, 
  // int NumberOfTeeth, float CogTeethProjection, color MainColor, 
  // color InnerColor, float RotationOffset, int DesignOption) 
  // RotationOffset is to align adjacent cogs with each other
  // Design options range from 1 - 2; 0 is no design option
  
  // Create background pattern of rotating cogs
  cogBkgdDiameterOuter = 100;
  cogBkgdDiameterInner = 75;
  numOfTeeth = 18;  
  cogBkgd[0] = new Cog(speed * 2, cogBkgdDiameterOuter, cogBkgdDiameterInner, numOfTeeth, 5, colorLightBrown, colorDarkTeal, 0, 0);
  cogBkgd[1] = new Cog(speed * 2, int(cogBkgdDiameterOuter * 0.6), int(cogBkgdDiameterInner * 0.6), numOfTeeth, 3, colorLightBrown, colorWhite, 0, 1);
  cogBkgd[2] = new Cog(reverseSpeed * 2, cogBkgdDiameterOuter, cogBkgdDiameterInner, numOfTeeth, 5, colorDarkBrown, colorDarkTeal, radians(5), 0);
  cogBkgd[3] = new Cog(reverseSpeed * 2, int(cogBkgdDiameterOuter * 0.6), int(cogBkgdDiameterInner * 0.6), numOfTeeth, 3, colorDarkBrown, colorWhite, radians(5), 2);
  
  // Create central cogs
  cogCentral[0] = new Cog(0, 725, 719, numOfTeeth, 80, colorWhite, colorWhite, 0, 0);        // White backdrop
  cogCentral[1] = new Cog(0, 720, 719, numOfTeeth, 80, colorDarkTan, colorLightTeal, 0, 0);  // Stationary back cog
  cogCentral[2] = new Cog(0, 480, 10, 0, 80, colorDarkBrown, colorDarkBrown, 0, 0);          // Stationary cog
  cogCentral[3] = new Cog(reverseSpeed, 350, 10, 96, 3, colorLightTan, colorDarkBrown, 0, 0);
  cogCentral[4] = new Cog(reverseSpeed, 323, 10, 96, 3, colorDarkBrown, colorDarkBrown, 0, 0);
  cogCentral[5] = new Cog(speed, 228, 10, 48, 3.75, colorLightTan, colorDarkBrown, 0, 0);
  cogCentral[6] = new Cog(speed, 196, 10, 48, 3.75, colorDarkBrown, colorDarkBrown, 0, 0);
  cogCentral[7] = new Cog(reverseSpeed, 135, 10, 48, 2.5, colorLightTan, colorDarkBrown, 0, 0);
  cogCentral[8] = new Cog(reverseSpeed, 107, 10, 48, 2.5, colorDarkBrown, colorDarkBrown, 0, 0);
  cogCentral[9] = new Cog(speed / 4, 68, 30, 24, 2.5, colorLightTan, colorDarkBrown, 0, 0);

  // Create central pattern of radial cogs for clock
  // Seconds
  for(int i=0; i < cogRadial1.length; i++){
     cogRadial1[i] = new Cog(reverseSpeed * 2, 15, 8, 6, 2.5, colorOrange, colorDarkBrown, 0, 0);
  }
  // Minutes
  for(int i=0; i < cogRadial2.length; i++){
     cogRadial2[i] = new Cog(speed, 25, 17, 6, 2.5, colorOrange, colorDarkBrown, 0, 0);
  }
  // Hours
  for(int i=0; i < cogRadial3.length; i++){
     cogRadial3[i] = new Cog(reverseSpeed * 4, 40, 25, 12, 2.5, colorOrange, colorDarkBrown, 0, 0);
  }
  // Outer ring 1
  for(int i=0; i < cogRadial4.length; i++){
     cogRadial4[i] = new Cog(speed * 4, 30, 22, 12, 2.5, colorOrange, colorDarkBrown, 0, 0);
  }
  // Outer ring 2
  for(int i=0; i < cogRadial5.length; i++){
     cogRadial5[i] = new Cog(speed * 4, 34, 24, 18, 2.5, colorOrange, colorDarkBrown, 0, 0);
  }
  // Outer ring 1 design option
  for(int i=0; i < cogRadial6.length; i++){
     cogRadial6[i] = new Cog(speed * 4, 15, 8, 12, 2.5, colorOrange, colorWhite, 0, 1);
  }
  // Outer ring 2 design option
  for(int i=0; i < cogRadial7.length; i++){
     cogRadial7[i] = new Cog(speed * 4, 15, 8, 18, 2.5, colorOrange, colorWhite, 0, 2);
  }
  
}


void draw() {
  background(colorDarkTeal);

  // *******************************************************
  // Create background pattern of rotating cogs

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



  // *******************************************************
  // Create central cogs
  // Sorted in order from background to foreground
  
  for(int i=0; i < cogCentral.length; i++){
     cogCentral[i].centerCog(width/2, height/2);
  }
  
  cogCentral[9].selectLightCog();



  // *******************************************************
  // Create central patterns of radial cogs
  
  float angle = -90;

  // Seconds
  float radius = 45; 
  for(int i=0; i < cogRadial1.length; i++){
     cogRadial1[i].radialCog(radius, angle);
     angle += TWO_PI / cogRadial1.length;
     
     int s = second();
     if(i == s/5){
       cogRadial1[i].illuminateTimeCog(colorLightTeal);
     }
     else{
       cogRadial1[i].illuminateTimeCog(colorOrange);
     }
  }
  
  // Minutes
  radius = 85;
  for(int i=0; i < cogRadial2.length; i++){
     cogRadial2[i].radialCog(radius, angle);
     angle += TWO_PI / cogRadial2.length;

     int m = minute();
     if(i == m/5){
       cogRadial2[i].illuminateTimeCog(colorLightTeal);
     }
     else{
       cogRadial2[i].illuminateTimeCog(colorOrange);
     }     
  }
  
  // Hours
  radius = 140;
  for(int i=0; i < cogRadial3.length; i++){
     cogRadial3[i].radialCog(radius, angle);
     angle += TWO_PI / cogRadial3.length;

     int h = hour();
     if(i == h/5){
       cogRadial3[i].illuminateTimeCog(colorLightTeal);
     }
     else{
       cogRadial3[i].illuminateTimeCog(colorOrange);
     }       
  }
  
  // Outer ring 1
  radius = 195;
  angle = 0;
  for(int i=0; i < cogRadial4.length; i++){
     cogRadial4[i].radialCog(radius, angle);
     angle += TWO_PI / cogRadial4.length;
  }
  
  // Outer ring 2
  radius = 220;
  angle = 25;
  for(int i=0; i < cogRadial5.length; i++){
     cogRadial5[i].radialCog(radius, angle);
     angle += TWO_PI / cogRadial5.length;
  }
    
  // Outer ring 1 design option
  radius = 195;
  angle = 0;
  for(int i=0; i < cogRadial6.length; i++){
     cogRadial6[i].radialCog(radius, angle);
     angle += TWO_PI / cogRadial6.length;
  }
  
  // Outer ring 2 design option
  radius = 220;
  angle = 25;
  for(int i=0; i < cogRadial7.length; i++){
     cogRadial7[i].radialCog(radius, angle);
     angle += TWO_PI / cogRadial7.length;
  }  
    
    
}


// *******************************************************
// Interactivity Functions

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
