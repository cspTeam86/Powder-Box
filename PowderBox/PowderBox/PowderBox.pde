// Imports //
import java.util.Collections;
import controlP5.*;

//
// Daylan Global Variables //
//
color BC = #9D9CD1; // Background color: Very light blue

int selectedElement = 1; // Element to be created when the mouse is pressed

ArrayList<Element> ElementData = new ArrayList<Element>();
ArrayList<Button> buttons = new ArrayList<Button>();

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
  fill(0);
  rect(0,0,ParticleMap.w*displayScale,ParticleMap.h*displayScale);
  // test text //
  //text("Main Window", 250, 250);
  //text("SideBar", 650, 250);
  
  // Andrew Draw //
  
  selectedElement = 0;
  for(int n = 0; n < buttons.size(); n++) {
    Button button = buttons.get(n);
    if(button.getBooleanValue() == true) {
      selectedElement = n+1;
    }
  }
  
  // Create Particles of the selected type when the mouse is pressed
  if(mousePressed == true && mouseX < ParticleMap.w*displayScale) {
    createParticle(ceil(mouseX/displayScale),ceil(mouseY/displayScale), selectedElement);
  }
  
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
  
  particleList.clear();
  fill(255);
  text(int(frameRate), 4, 15);
}////////////////////////////////////////////////////////////////

//            //
// Interrupts //
//            //

// Interrupt: controlEvent
// Grabs all of the events from the controllers of cp5 //
// Currently just using it for grabbing the selected element //
public void controlEvent(ControlEvent theEvent) {
  println("cp5 - " + theEvent.getController().getName());
  selectedElement = int(theEvent.getController().getName());
}

/////////////////////////////////////////////////////////////////

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
Button makeButton(String Name, float X, float Y, int Width, int Height, String Label) {
  return cp5.addButton(Name)
     .setValue(0)
     .setPosition(X, Y)
     .setSize(Width, Height)
     .setLabel(Label)
     .setSwitch(true);
}

//
// function: makeElementButtons
//
void makeElementButtons(ArrayList<Element> list) {
  float currentX = 510;
  float currentY = 10;
  
  for(i = 0; i<list.size(); i++) {
    buttons.add(makeButton(str(list.get(i).Number), currentX, currentY, 25, 25, list.get(i).Symbol));
    currentX+=35;
    if(currentX > 760) {
      currentX = 510;
      currentY += 35;
    }
  }
  
}

//
// function: createParticle
//
void createParticle(int x, int y, int number) {
  if(number != 0) {
    if(ParticleMap.isFree(x,y) == true) {
      ParticleMap.createParticle(x, y, ElementData.get(number-1));
    }
  } else {
    ParticleMap.removeParticle(x, y);
  }
}
