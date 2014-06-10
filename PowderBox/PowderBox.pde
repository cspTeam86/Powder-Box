/*
  
  
  
*/

// Imports //
import java.util.Collections;
import controlP5.*;

//
// Daylan Global Variables //
//
color BC = #9D9CD1; // Background color: Very light blue

int selectedElement = 1; // Element to be created when the mouse is pressed

ArrayList<Element> ElementData = new ArrayList<Element>();

// Indexes //
int i = 0;
int j = 0;

ControlP5 cp5;
fileIO FIO = new fileIO();

//
// Andrew Global Variables //
//
Map ParticleMap;
IntList HashList;
ArrayList<Particle> particleList;

public int displayScale = 4;

int SOLID = 1;
int LIQUID = 2;
int GAS = 3;
int NONE = 4;

//
// Function: setup
//
void setup() {
  // Daylan Setup //
  size(800, 500);
  cp5 = new ControlP5(this);
  ElementData = FIO.getElementList("Elements.txt");
  makeElementButtons(ElementData);
  
  // Andrew Setup //
  initFlags();
  ParticleMap = new Map(125, 125);
  HashList = new IntList();
  particleList = new ArrayList<Particle>();
}///////////////////////////////////////////////////////////////////


//
// Function: draw
//
void draw() {
  // Daylan Draw //
  background(BC);
  
  // draw dividers //
  stroke(0);
  line(500, 0, 500, height);

  // test text //
  text("Main Window", 250, 250);
  text("SideBar", 650, 250);
  
  // Andrew Draw //
  /*
  if(mousePressed == true && mouseButton == CENTER) {
   ParticleMap.removeParticle(ceil(constrain(mouseX/displayScale,0,ParticleMap.w-1)),ceil(constrain(mouseY/displayScale,0,ParticleMap.w-1)));
   }
   */
  for (int y = ParticleMap.h; y >= 0; y--) {
    for (int x = 0; x < ParticleMap.w; x++) {
      Particle part = ParticleMap.getParticle(x, y);
      if (part != null) {
        particleList.add(part);
      }
    }
  }
  
  Collections.shuffle(particleList);
  
  for(Particle p: particleList) {
    p.update();
    p.display();
  }
  
  if (mousePressed == true && ParticleMap.isFree(ceil(constrain(mouseX/displayScale, 0, ParticleMap.w-1)), ceil(constrain(mouseY/displayScale, 0, ParticleMap.w-1))) == true) {
    if (mouseButton == LEFT) {
      ParticleMap.createParticle(LIQUID, color(0, 255, 0), ceil(constrain(mouseX/displayScale, 0, ParticleMap.w-1)), ceil(constrain(mouseY/displayScale, 0, ParticleMap.w-1)));
    } 
    else if (mouseButton == RIGHT) {
      ParticleMap.createParticle(GAS, color(255, 0, 0), ceil(constrain(mouseX/displayScale, 0, ParticleMap.w-1)), ceil(constrain(mouseY/displayScale, 0, ParticleMap.w-1)));
    } 
    else if (mouseButton == CENTER) {
      ParticleMap.createParticle(SOLID, color(0, 0, 255), ceil(constrain(mouseX/displayScale, 0, ParticleMap.w-1)), ceil(constrain(mouseY/displayScale, 0, ParticleMap.w-1)));
    }
  }
  //fill(255);
  //text(HashList.size(), 10, 30);
  particleList.clear();
  fill(255);
  text(frameRate, 10, 15);
}////////////////////////////////////////////////////////////////

//           //
// FUNCTIONS //
//           //

// function: initFlags
void initFlags() {
  frameRate(60);
  noStroke();
  smooth();
}

//
// function: makeButton
// Creates a new CP5 button.
//
void makeButton(String Name, float X, float Y, int Width, int Height, String Label) {
  cp5.addButton(Name)
     .setValue(0)
     .setPosition(X, Y)
     .setSize(Width, Height)
     .setLabel(Label)
     ;
}

//
// function: makeElementButtons
// 
void makeElementButtons(ArrayList<Element> list) {
  float currentX = 510;
  float currentY = 10;
  
  for(i = 0; i<list.size(); i++) {
    makeButton(str(list.get(i).Number), currentX, currentY, 25, 25, list.get(i).Symbol);
    currentX+=35;
    if(currentX > 760) {
      currentX = 510;
      currentY += 35;
    }
  }
  
}
