

class FuelConsumptionCalculator {

  static const double MpgModificator = 1.60934;
  static const double UsMpgDelimiter = 3.78541;
  static const double UkMpgDelimiter = 4.54609;
  static const double UsUkModificator = 0.8028;
  static const double UkUsModificator = 1.2455;

  static const double _ukMpgMod = 1.20155;

  static const double _usToEuMpgMod = 235.214583;
  static const double _ukToEuMpgMod = 282.481053;

  static const double _kmlToUsMpgMod = 0.282545;
  static const double _kmlToUkMpgMod = 0.354006;


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

  String UsMpgToUkMpg ( double value, {bool reverse = false}){
    if ( reverse == false ) {
      // Us Mpg to Uk Mpg
      return ( (value * MpgModificator) / UkMpgDelimiter ).toStringAsFixed(2);
    }
    else {
      // Uk Mpg to Us Mpg
      return (( value * UkMpgDelimiter) / MpgModificator ).toStringAsFixed(2);
    }
  }

//// US ===> UK

  String fromUsToUk ( double value ) {
    return (value * _ukMpgMod).toStringAsFixed(2);
  }

  String fromUkToUs ( double value ) {
    return (value / _ukMpgMod).toStringAsFixed(2);
  }

//// US ===> L/100 & L/100 ===> US
  String fromUsToEuMix (double value) {
    return ( _usToEuMpgMod / value).toStringAsFixed(2);
  }

//// UK ===> L/100 & L/100 ===> UK
  String fromUkToEuMix (double value) {
    return ( _ukToEuMpgMod / value).toStringAsFixed(2);
  }

//// KmL ===> ALL

  String fromUsToKmL ( double val ){
    return ( _kmlToUsMpgMod * val ).toStringAsFixed(2);
  }

  String fromUkToKmL ( double val ){
    return ( _kmlToUkMpgMod * val ).toStringAsFixed(2);
  }
}