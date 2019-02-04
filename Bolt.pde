// Class for all cog construction and animation
class Bolt {
  
  // Class Variables
  float safeXPos = width/2;
  float safeYPos = height/2;
  float safeShift = 0;
  float xPos;
  float yPos;
  float boltRadius;
  float boltLength;
  float boltWidth;
  color boltColor1;
  color boltColor2;
  float rotationOffset;
  float retraction;

  
  // *******************************************************
  // Constructor
  
  Bolt(float bLength,float bWidth, float radius, color bColor1, color bColor2, float rOffset){
    boltLength = bLength;
    boltWidth = bWidth;
    boltRadius = radius;
    boltColor1 = bColor1;
    boltColor2 = bColor2;
    rotationOffset = rOffset;
  }


  // *******************************************************
  // Cog Class Methods
  // The following methods each perform separate actions and are sorted in the order of operations
  

  

 
 
  // *******************************************************
  // Bolt basic actions  
  

  void unlockSafe(){
    if(mousePressed){
       retraction = 0.3;
    }
    else{
       retraction  = 0.8;
    }
    allBolts();
  }
 
   

  // *******************************************************
  // Create bolts located in center of sketch and in a radial pattern
  
  void allBolts(){  
    float angle = 0;
    for(int i=0; i < boltRadial.length; i++){
       boltRadial[i].retractBolt(angle);
       boltRadial[i].radialBolt(angle);
       angle += TWO_PI / boltRadial.length;
    }  
  }
  
  
  void retractBolt(float angle){
    xPos = boltRadius * cos(angle);
    yPos = boltRadius * sin(angle);
    pushMatrix();
    translate(safeXPos + safeShift + xPos, safeYPos + yPos);
    rotate(angle);
    translate(boltLength * retraction, 0);
    createBolt(boltLength * 0.6, boltWidth * 0.8, boltColor1, boltColor2, rotationOffset);
    popMatrix();
  }
  
  
  void radialBolt(float angle){
    xPos = boltRadius * cos(angle);
    yPos = boltRadius * sin(angle);
    pushMatrix();
    translate(safeXPos + safeShift + xPos, safeYPos + yPos);
    rotate(angle);
    createBolt(boltLength, boltWidth, boltColor1, boltColor2, rotationOffset);
    
    translate((boltLength / -2) - 2, 0);
    for(int i=1; i < 4; i++){
       createBolt(2, boltWidth * (1 - ((2 * i) * 0.1)), boltColor1, boltColor2, rotationOffset);
       translate(-3, 0);
    }
    
    popMatrix();
  }
   
   
  // *******************************************************
  // Universal bolt creation
  
  void createBolt(float createBoltLength, float createBoltWidth, color createBoltColor1, color createBoltColor2, float rotationOffset){
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(0, 0, createBoltLength, createBoltWidth);
    
    pushMatrix(); 
    translate(createBoltLength / -2, createBoltWidth / -2);
   
    strokeWeight(2.0);
    strokeCap(SQUARE);
    
    // The following for loop block of code referenced from Processing Reference Guide example of lerpColor() function
    // Link: https://processing.org/examples/lineargradient.html   
    for(int i=0; i < createBoltWidth; i++){
      float gradRange = map(i, 0, createBoltWidth, 0.0, 1.0);
      color gradient = lerpColor(createBoltColor1, createBoltColor2, gradRange);
      stroke(gradient);
      line(0, i , createBoltLength, i);
    }
    // End of referenced code block
    
    popMatrix();
    
    
  }




  
}
