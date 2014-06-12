public class Particle {
  public int x, y;
  public String symbol;
  public int number;
  public color c;
  public int state;
  public float density;
  public int oldX, oldY;
  public float temp;
  public float MeltingPoint;
  public float BoilingPoint;

  public Particle(int x, int y, Element element) {
    this.x = x;
    this.y = y;
    this.c = element.Color;
    this.density = 1;
    this.symbol = element.Symbol;
    this.number = element.Number;
    this.MeltingPoint = element.MeltingPoint;
    this.BoilingPoint = element.BoilingPoint;
    this.temp = 294;
    this.state = LIQUID;
  }



  public void update() {
    oldX = this.x;
    oldY = this.y;
    if (this.temp >= this.BoilingPoint) {
      this.state = GAS;
    } 
    else if (this.temp >= this.MeltingPoint) {
      this.state = LIQUID;
    } 
    else {
      this.state = SOLID;
    }
    // I forgot switch statements need constant values, will replace with if statement
    // P.S. state cannot be static because the value must be able to change
    // P.P.S static variables cannot be declared in a class that is not static, and this class CANNOT be static
    // Update: swapped switch statement with if statement
    if (state == SOLID) {
      if (ParticleMap.isFree(this.x, this.y+1) == false) {
        int randir = int(random(2))*2-1;
        if (ParticleMap.isFree(this.x-randir, this.y) == true && ParticleMap.isFree(this.x-randir, this.y+1)) {
          this.addToX(-randir);
          this.addToY(1);
        } 
        else if (ParticleMap.isFree(this.x+randir, this.y) == true && ParticleMap.isFree(this.x+randir, this.y+1)) {
          this.addToX(randir);
          this.addToY(1);
        }
      } 
      else {
        this.addToY(1);
      }
    }
    else if (state == LIQUID) {
      if (ParticleMap.isFree(this.x+1, this.y) == true || ParticleMap.isFree(this.x-1, this.y) == true || ParticleMap.isFree(this.x, this.y+1) == true) {
        if (ParticleMap.isFree(this.x, this.y+1) == false) {
          int randir = int(random(2))*2-1;
          if (ParticleMap.isFree(this.x-randir, this.y) == true) {
            this.addToX(-randir);
          } 
          else if (ParticleMap.isFree(this.x+randir, this.y) == true) {
            this.addToX(randir);
          }
        } 
        else {
          this.addToY(1);
        }
      }
    } 
    else if (state == GAS) {
      int randir = int(random(2))*2-1;
      if (int(random(2)) == 0 && (ParticleMap.isFree(this.x+1, this.y) || ParticleMap.isFree(this.x-1, this.y))) {
        if (ParticleMap.isFree(this.x+randir, this.y)) {
          this.addToX(randir);
        } 
        else if (ParticleMap.isFree(this.x-randir, this.y)) {
          this.addToX(-randir);
        }
      } 
      else if (ParticleMap.isFree(this.x, this.y+1) || ParticleMap.isFree(this.x, this.y-1)) {
        if (ParticleMap.isFree(this.x, this.y+randir)) {
          this.addToY(randir);
          ;
        } 
        else if (ParticleMap.isFree(this.x, this.y-randir)) {
          this.addToY(-randir);
        }
      }
    } 
    else if (state == NONE) {
      // Do nothing; this particle is static.
      // Used for wall particles
    } 
    else {
    }
    /*
    if (this.y == 0) ParticleMap.removeParticle(this);
     if (this.y == ParticleMap.h) ParticleMap.removeParticle(this);
     if (this.x == 0) ParticleMap.removeParticle(this);
     if (this.x == ParticleMap.w) ParticleMap.removeParticle(this);
     */
  }

  public void display() {
    fill(c);
    rect(x*displayScale, y*displayScale, displayScale, displayScale);
  }

  public void addToX(int val) {
    this.x += val;
    ParticleMap.swapParticle(oldX, oldY, this.x, this.y);
    oldX = this.x;
    oldY = this.y;
  }

  public void addToY(int val) {
    this.y += val;
    ParticleMap.swapParticle(oldX, oldY, this.x, this.y);
    oldX = this.x;
    oldY = this.y;
  }
}


