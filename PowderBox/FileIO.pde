
class fileIO {
  
  // function: getElementList //
  ArrayList<Element> getElementList(String filename) {
    // we are getting the elements from an input .dat file
    
    ArrayList<Element> R = new ArrayList<Element>(); // Arraylist to be returned
    
    BufferedReader reader = createReader(filename); // file reader
    String line;
    
    // Placeholder data
    String tag;
    
    // Data to go in the elements
    Boolean Element = true;
    int Number = 0;
    String Symbol = null;
    color Color = color(0,0,0);
    float Density_G = 0;
    float Density_L = 0;
    float Density_S = 0;
    float MeltingPoint = 0;
    float BoilingPoint = 0;
    float EnthalpyF = 0;
    float EntropyF = 0;
    
    while(true) { // readfile loop //
      
      try {
        line = reader.readLine();
      }catch(IOException e) { // found EOF or something else weird
        e.printStackTrace();
        line = null;
      }
      if(line == null) {
        break;
      }
      
      println(line);
      
      if(match(line, "//") == null) {
        if(match(line, "<finish>") != null) {
          R.add(new Element(Element,
                            Number,
                            Symbol,
                            Color,
                            Density_G,
                            Density_L,
                            Density_S,
                            MeltingPoint,
                            BoilingPoint,
                            EnthalpyF,
                            EntropyF
                            ));
          Number = 0;
          Symbol = "";
        }else {
          // If statements for all the tags that store our data
          // AGG!
          
          // Element //
          // Whether it is an element or a compound //
          tag = findTag(line, "Element");
          if(tag != null) {
            Element = boolean(tag);
          }
          // Atomic number //
          tag = findTag(line, "Number");
          if(tag != null) {
            Number = int(tag);
          }
          // Symbol //
          tag = findTag(line, "Symbol");
          if(tag != null) {
            Symbol = tag;
          }
          // Color //
          tag = findTag(line, "Color");
          if(tag != null) {
            Color = unhex(tag);
          }
          // Boiling Point //
          tag = findTag(line, "BoilingPoint");
          if(tag != null) {
            BoilingPoint = float(tag);
          }
          // Melting Point //
          tag = findTag(line, "MeltingPoint");
          if(tag != null) {
            MeltingPoint = float(tag);
          }
          // Density as a Gas //
          
          // Density as a Liquid //
          
          // Density as a Solid //
        }
      }
    }
    return R;
    
  }
  
  // function: findTag
  String findTag(String Input, String tag) {
    String R = null;
    try {
      R = match(Input, "<"+tag+">"+"(.*?)"+"</"+tag+">")[1];
    }catch(NullPointerException e) {
      R = null;
    }
    
    return R;
  }
}
