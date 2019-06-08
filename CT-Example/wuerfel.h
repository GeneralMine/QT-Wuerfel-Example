#ifndef WUERFEL_H
#define WUERFEL_H

#include <QQuickItem>

class Wuerfel : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QString farbe READ getFarbe WRITE setFarbe NOTIFY farbeChanged)
    Q_PROPERTY(int seitenZahl READ getSeitenZahl WRITE setSeitenZahl NOTIFY seitenZahlChanged)
public:
    explicit Wuerfel(QQuickItem *parent = nullptr);

    //Getter
    QString getFarbe();
    int getSeitenZahl();
    //Setter
    void setFarbe(QString value);
    void setSeitenZahl(int newSeitenZahl);
    //Methods
    Q_INVOKABLE int wuerfeln();

private:
    int seitenZahl = 3;
    QString farbe;

signals:
    void farbeChanged();
    void seitenZahlChanged();

public slots:

};

#endif // WUERFEL_H
