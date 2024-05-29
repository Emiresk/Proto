

class FuelConsumptionCalculator {

  static const double MpgModificator = 1.60934;
  static const double UsMpgDelimiter = 3.78541;
  static const double UkMpgDelimiter = 4.54609;
  static const double UsUkModificator = 0.8028;
  static const double UkUsModificator = 1.2455;



  double UsMpgToLitres ( double value, {bool reverse = false}){
    if ( reverse == false ) {
      // Us Mpg to L100Km
      return ( (value * MpgModificator) / UsMpgDelimiter );
    }
    else {
      // L100Km to Us Mpg
      return (( value * UsMpgDelimiter) / MpgModificator );
    }
  }

  double UkMpgToLitres ( double value, {bool reverse = false}){
    if ( reverse == false ) {
      // Uk Mpg to L100Km
      return ( (value * MpgModificator) / UkMpgDelimiter );
    }
    else {
      // L100Km to Uk Mpg
      return (( value * UkMpgDelimiter) / MpgModificator );
    }
  }

  double UsMpgToUkMpg ( double value, {bool reverse = false}){
    if ( reverse == false ) {
      // Us Mpg to Uk Mpg
      return ( (value * MpgModificator) / UkMpgDelimiter );
    }
    else {
      // Uk Mpg to Us Mpg
      return (( value * UkMpgDelimiter) / MpgModificator );
    }
  }
}