public class Particle {
  protected String name;
  //protected int id;
  protected color Color;
  //protected float temperature;
  protected float x, y;
  protected int state;
  
  public Particle(float x_, float y_) {
    
  }
  
  public void update(int state) {
    switch(state) {
      case 0:
        //NO STATE
        break;
      case 1:
        //SOLID STATE
        
        break;
      case 2:
        //LIQUID STATE
        
        break;
      case 3:
        //GAS STATE
        
        break;
    }
  }
  
}
