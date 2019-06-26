#ifndef TEMPERATURE_H
#define TEMPERATURE_H

#include <cstdarg>
#include <cstdint>
#include <cstdlib>
#include <new>


extern "C" {

double convert_to_celcius(double kelvinvalue);

double convert_to_fahrenheit(double kelvinvalue);

double convert_to_kelvin(double value, bool is_celcius);

} // extern "C"

#endif /* TEMPERATURE_H */
