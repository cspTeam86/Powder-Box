
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
    int Number = 0;
    String Symbol = null;
    
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
          R.add(new Element(Number, Symbol));
          Number = 0;
          Symbol = "";
        }else {
          // If statements for all the tags that store our data
          // AGG!
          tag = findTag(line, "Number");
          if(tag != null) {
            Number = int(tag);
          }
          
          tag = findTag(line, "Symbol");
          if(tag != null) {
            Symbol = tag;
          }
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
