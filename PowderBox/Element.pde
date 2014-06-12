
//
// Class: Element
//
class Element {
  
  int Number;
  String Symbol;
  
  //Element
  Boolean Element;
  
  // Physical properties //
  color Color;
  
  // Density//
  float Density_G;
  float Density_L;
  float Density_S;
  
  // Melting Point //
  float MeltingPoint;
  
  // Boiling Point //
  float BoilingPoint;
  
  // Entropy of formation //
  float EntropyF;
  
  // Enthalpy of formation is always zero for elements in their natural state //
  float EnthalpyF;
  
  // Compound specific data //
  // Elements needed for formation //
  String ElementsNeeded;
  
  Element(Boolean Element,
          int _Number,
          String _Symbol,
          color _Color,
          float _Density_G,
          float _Density_L,
          float _Density_S,
          float _MeltingPoint,
          float _BoilingPoint,
          float _EntropyF,
          float _EnthalpyF,
          String _ElementsNeeded
          ) {
    
    
    if(Element) {
      Number = _Number;
      EnthalpyF = _EnthalpyF;
    }else {
      Number = 0;
      ElementsNeeded = _ElementsNeeded;
    }
    
    Symbol = _Symbol;
    Number = _Number;
    Color = _Color;
    MeltingPoint = _MeltingPoint;
    BoilingPoint = _BoilingPoint;
    
    Density_G = _Density_G;
    Density_L = _Density_L;
    Density_S = _Density_S;
  }
  
}
