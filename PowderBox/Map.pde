public class Map {
  public int w, h;
  public Particle map[][];

  public Map(int w, int h) {
    map = new Particle[h+1][w+1];
    this.w = w;
    this.h = h;
  }

  public Particle getParticle(int x, int y) {
    return map[y][x];
  }

  public void createParticle(int state, color c, int x, int y) {
    this.map[y][x] = new Particle(state, c, x, y);
  }

  public void removeParticle(int x, int y) {
    this.map[y][x] = null;
  }

  public void removeParticle(Particle p) {
    this.map[p.y][p.x] = null;
  }
  
  // Replaces a particle with another particle
  // a Particle: the particle to write; b Particle: the particle to replace
  public void replaceParticle(Particle a, Particle b) {
    this.map[b.y][b.x] = a;
    this.map[a.y][a.x] = null;
  }
  
  public void swapParticle(Particle a, Particle b) {
    this.map[b.y][b.x] = a;
    this.map[a.y][a.x] = b;
  }
  
  public void swapParticle(int x1, int y1, int x2, int y2) {
    Particle temp = this.getParticle(x2,y2);
    this.map[y2][x2] = this.getParticle(x1,y1);
    this.map[y1][x1] = temp;
  }
  
  public void moveParticle(int x1, int y1, int x2, int y2) {
    Particle p = map[y1][x1];
    this.map[y2][x2] = p;
    this.map[y1][x1] = null;
  }
  
  public boolean isFree(int x, int y) {
    Particle p = this.map[y][x];
    if(p == null) {
      return true;
    } else {
      return false;
    }
  }
}
