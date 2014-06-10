import java.util.Collections;

Map ParticleMap;
IntList HashList;
ArrayList<Particle> particleList;

public int displayScale = 4;

int SOLID = 1;
int LIQUID = 2;
int GAS = 3;
int NONE = 4;

void setup() {
  size(512, 512);
  initFlags();
  ParticleMap = new Map(128, 128);
  HashList = new IntList();
  particleList = new ArrayList<Particle>();
}

void draw() {
  background(0);
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
}

void initFlags() {
  frameRate(60);
  noStroke();
  smooth();
}

