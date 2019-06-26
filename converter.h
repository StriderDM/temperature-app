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
    double round(double value);
};

#endif // CONVERTER_H
