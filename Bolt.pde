// Class for all bolt construction and animation
class Bolt {
  
  // Class Variables 
  float boltRadius = 288;    // Since all bolts are the same size, the dimensions are defined
  float boltLength = 110;    // here locally within the class
  float boltWidth = 40;
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  
  Bolt(){
  }

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Bolt Class Methods

  // *******************************************************
  // Construct an individual bolt composed of rectangles that are either static or retract   
  void radialBolt(float x, float y, float angle, boolean retractBolt){
    float centerXPos = x;
    float centerYPos = y;
    float xPos = boltRadius * cos(angle);
    float yPos = boltRadius * sin(angle);
    pushMatrix();
    translate(centerXPos + xPos, centerYPos + yPos);        // Defines new origin
    rotate(angle);
    createBolt(boltLength, boltWidth);                      // Create main bolt rect
    if(retractBolt){                                        // Option to create retracting bolts
      translate(boltLength * retraction, 0);                // Retraction variable moves bolt in/out
      createBolt(boltLength * 0.6, boltWidth * 0.8);        // Create retracting bolt rect
    }
    else{                                                   // Default option to create static bolts
      translate((boltLength / -2) - 2, 0);
      for(int i=1; i < 4; i++){
         createBolt(2, boltWidth * (1 - ((2 * i) * 0.1)));  // Create small rectangles at bolt base 
         translate(-3, 0);                                  
      }
    }
    popMatrix();
  }  
  
  // *******************************************************
  // Create shape and gradient for an individual bolt rectangle
  void createBolt(float createBoltLength, float createBoltWidth){
    noStroke();                                            
    fill(255);                                             
    rectMode(CENTER);                                      // Create solid white background rectangle behind the gradient
    rect(0, 0, createBoltLength, createBoltWidth);         // to hide any gaps between lines in the following gradient array
    pushMatrix(); 
    translate(createBoltLength / -2, createBoltWidth / -2);
    strokeWeight(2.0);
    strokeCap(SQUARE);
    // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
    /** The following for loop block of code is referenced from Processing Reference Guide example 
        of lerpColor() function. Link: https://processing.org/examples/lineargradient.html
        It applies a gradient to rect along short axis using an array of lines each with a variation 
        of a color defined by a color gradient range.
    **/    
    for(int i=0; i < createBoltWidth; i++){
      float gradRange = map(i, 0, createBoltWidth, 0.0, 1.0);
      //color gradient = lerpColor(createBoltColor1, createBoltColor2, gradRange);
      color gradient = lerpColor(colorWhite, colorGradient, gradRange);
      stroke(gradient);
      line(0, i , createBoltLength, i);
    }
    // End of referenced code block
    // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
    popMatrix();
  }
}
