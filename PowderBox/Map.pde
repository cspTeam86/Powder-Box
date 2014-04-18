public class Map {
  Particle[][] map;
  int w, h;
  public Map(int w_, int h_) {
    map = new Particle[h_][w_];
    h = h_;
    w = w_;
  }
  
  public void display(int top_left_x, int top_left_y) {
    for(int y = 0; y < h; y++) {
      for(int x = 0; x < w; x++) {
        fill(map[y][x].Color);
        rect(x*2+top_left_x,y*2+top_left_y,2,2);
      }
    }
  }
  
  public void removePart(float x_, float y_) {
    map[int(y_)][int(x_)] = null;
  }
  
  public Particle createParticleObject(String name, float x, float y) {
    Class part_class = Class.forName(name);
    Particle particle = part_class.newInstance(x,y);
    return particle;
  }
  public void createParticle(Particle p) {
    this.map[int(p.y)][int(p.x)] = p;
  }
  
}
