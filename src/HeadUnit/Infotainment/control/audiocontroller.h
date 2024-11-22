#ifndef AUDIOCONTROLLER_H
#define AUDIOCONTROLLER_H

#include <QObject>

class AudioController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int volumeLevel READ volumeLevel WRITE setVolumeLevel NOTIFY volumeLevelChanged FINAL)
public:
    explicit AudioController(QObject *parent = nullptr);
    Q_INVOKABLE void incrementVolume(const int &val);
    int volumeLevel() const;
    void setVolumeLevel(int newVolumeLevel);

signals:
    void volumeLevelChanged();
private:
    int m_volumeLevel;
};

#endif // AUDIOCONTROLLER_H
