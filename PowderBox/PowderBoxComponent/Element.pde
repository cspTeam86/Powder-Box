
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
  }
  
}
