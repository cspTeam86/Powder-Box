
//
// Class: Element
//
class Element {
  
  int Number;
  String Symbol;
  
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
  float EnthalpyF = 0;
  
  Element(int _Number,
          String _Symbol,
          color _Color,
          float _Density_G,
          float _Density_L,
          float _Density_S,
          float _MeltingPoint,
          float _BoilingPoint
          ) {
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