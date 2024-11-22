#ifndef HVACHANDLER_H
#define HVACHANDLER_H

#include <QObject>

class HVACHandler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int targetTemperture READ targetTemperture WRITE setTargetTemperture NOTIFY targetTempertureChanged FINAL)
public:
    explicit HVACHandler(QObject *parent = nullptr);

    Q_INVOKABLE void incrementTargetTemperature( const int &val);
    int targetTemperture() const;

public slots:
    void setTargetTemperture(int newTargetTemperture);

signals:
    void targetTempertureChanged();

private:

    int m_targetTemperture;
};

#endif // HVACHANDLER_H
