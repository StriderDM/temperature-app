#ifndef CONVERTER_H
#define CONVERTER_H
#include <QObject>
#include "temperature.h"

class Converter : public QObject
{
    Q_OBJECT
public:
    explicit Converter(QObject *parent = nullptr);

public slots:
    double convert(QString value, int action);
private:
    double To_Fahrenheit(double value, int measure);
    double To_Celcius(double value, int measure);
    double To_Kelvin(double value, int measure);
    double round(double value);
};

#endif // CONVERTER_H
