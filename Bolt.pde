// Class for all bolt construction and animation
class Bolt {
  
  // Class Variables 
  float safeXPos = width/2;
  float safeYPos = height/2;
  float boltRadius = 288;
  float boltLength = 110;
  float boltWidth = 40;
  boolean activate = false;
  
  // *******************************************************
  // Constructor
  
  Bolt(){
  }

  // *******************************************************
  // Bolt Class Methods
  // The following methods each perform separate actions and are sorted in the order of operations

  // *******************************************************
  // Create a ring of rectangles representing bolts with the capacity to retract   
  void retractBolt(float angle){
    xPos = boltRadius * cos(angle);
    yPos = boltRadius * sin(angle);
    pushMatrix();
    translate(safeXPos + safeShift + xPos, safeYPos + yPos);
    rotate(angle);
    translate(boltLength * retraction, 0);
    createBolt(boltLength * 0.6, boltWidth * 0.8);
    popMatrix();
  }

  // *******************************************************
  // Create a ring of rectangles representing bolts 
  void radialBolt(float angle){
    xPos = boltRadius * cos(angle);
    yPos = boltRadius * sin(angle);
    pushMatrix();
    translate(safeXPos + safeShift + xPos, safeYPos + yPos);
    rotate(angle);
    createBolt(boltLength, boltWidth);
    translate((boltLength / -2) - 2, 0);
    for(int i=1; i < 4; i++){
       createBolt(2, boltWidth * (1 - ((2 * i) * 0.1)));
       translate(-3, 0);
    }
    popMatrix();
  }
   
  // *******************************************************
  // Create individual bolts with a retracting inner bolt
  void createBolt(float createBoltLength, float createBoltWidth){
    
    // Create solid white background rectangle behind the gradient
    // to hide any gaps between lines in the following array
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(0, 0, createBoltLength, createBoltWidth);

    // Apply gradient to bolt shapes along short axis using an array of lines
    // each with a variation of a color defined by a color gradient range    
    pushMatrix(); 
    translate(createBoltLength / -2, createBoltWidth / -2);
    strokeWeight(2.0);
    strokeCap(SQUARE);
    // The following for loop block of code referenced from Processing Reference Guide example of lerpColor() function
    // Link: https://processing.org/examples/lineargradient.html   
    for(int i=0; i < createBoltWidth; i++){
      float gradRange = map(i, 0, createBoltWidth, 0.0, 1.0);
      //color gradient = lerpColor(createBoltColor1, createBoltColor2, gradRange);
      color gradient = lerpColor(colorWhite, colorGradient, gradRange);
      stroke(gradient);
      line(0, i , createBoltLength, i);
    }
    // End of referenced code block
    popMatrix();
    
  }
}
