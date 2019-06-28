#include "converter.h"
//#include <QtDebug>
#include <cmath>

Converter::Converter(QObject *parent) : QObject(parent) {}

double Converter::round(double value)
{
    return std::round(value*10)/10;
}

double Converter::convert(QString value, int action)
{
    bool convertible = false;
    bool* canConvert = &convertible;
    double val = value.toDouble(canConvert);
    double retVal = 0.0;
    if (*canConvert == true)
    {
        /* Actions:
            "°C -> °F"; value: 1
            "°F -> °C"; value: 2
            " K -> °C"; value: 3
            "°C ->  K"; value: 4
            " K -> °F"; value: 5
            "°F ->  K"; value: 6 */
        switch (action) {
        case 1 : retVal = convert_to_fahrenheit(convert_to_kelvin(val,true)); break;
        case 2 : retVal = convert_to_celcius(convert_to_kelvin(val,false)); break;
        case 3 : retVal = convert_to_celcius(val); break;
        case 4 : retVal = convert_to_kelvin(val,true); break;
        case 5 : retVal = convert_to_fahrenheit(val); break;
        case 6 : retVal = convert_to_kelvin(val,false); break;
        default: retVal = 0.0;
        }
    }
    return round(retVal);
}
