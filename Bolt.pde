// Class for all bolt construction and animation
class Bolt {
  
  // Class Variables 
  //float safeXPos = width/2;
  //float safeYPos = height/2;
  float centerXPos;
  float centerYPos;
  float boltRadius = 288;
  float boltLength = 110;
  float boltWidth = 40;
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  
  Bolt(){
  }

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Bolt Class Methods

  void radialBolt(float x, float y, float angle, boolean retractBolt){
    centerXPos = x;
    centerYPos = y;
    xPos = boltRadius * cos(angle);
    yPos = boltRadius * sin(angle);
    pushMatrix();
    translate(centerXPos + xPos, centerYPos + yPos);  // Positions origin at center of safe door
    rotate(angle);
    createBolt(boltLength, boltWidth);
    if(retractBolt){
      translate(boltLength * retraction, 0);            // Retraction variable moves bolt in/out
      createBolt(boltLength * 0.6, boltWidth * 0.8);
    }
    else{
      translate((boltLength / -2) - 2, 0);
      for(int i=1; i < 4; i++){
         createBolt(2, boltWidth * (1 - ((2 * i) * 0.1)));
         translate(-3, 0);
      }
    }
    popMatrix();
  }  
  
  
  
/**
  // *******************************************************
  // Create a ring of rectangles representing bolts that retract   
  void retractBolt(float x, float y, float angle){
    centerXPos = x;
    centerYPos = y;
    xPos = boltRadius * cos(angle);
    yPos = boltRadius * sin(angle);
    pushMatrix();
    translate(centerXPos + xPos, centerYPos + yPos);  // Positions origin at center of safe door
    rotate(angle);
    translate(boltLength * retraction, 0);            // Retraction variable moves bolt in/out
    createBolt(boltLength * 0.6, boltWidth * 0.8);
    popMatrix();
  }

/**
  // *******************************************************
  // Create a ring of rectangles representing bolts 
  void radialBolt(float x, float y, float angle){
    centerXPos = x;
    centerYPos = y;
    xPos = boltRadius * cos(angle);
    yPos = boltRadius * sin(angle);
    pushMatrix();
    translate(centerXPos + xPos, centerYPos + yPos);  // Positions origin at center of safe door
    rotate(angle);
    createBolt(boltLength, boltWidth);
    translate((boltLength / -2) - 2, 0);
    for(int i=1; i < 4; i++){
       createBolt(2, boltWidth * (1 - ((2 * i) * 0.1)));
       translate(-3, 0);
    }
    popMatrix();
  }
**/
   
  // *******************************************************
  // Create shape and gradient for an individual bolt
  void createBolt(float createBoltLength, float createBoltWidth){
    
    // Create solid white background rectangle behind the gradient
    // to hide any gaps between lines in the following gradient array
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
