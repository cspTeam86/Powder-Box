public class Water extends Particle {
  
  public Water(float x_, float y_) {
    name = "Water";
    Color = color(0,0,255);
    state = 2;
    x = x_;
    y = y_;
    super(x_,y_);
  }
  
  public void update() {
    super.update();
    
  }
  
}
