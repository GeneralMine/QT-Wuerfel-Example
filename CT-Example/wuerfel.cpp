#include "wuerfel.h"

Wuerfel::Wuerfel(QQuickItem *parent) : QQuickItem(parent)
{

}

QString Wuerfel::getFarbe(){
    return farbe;
}
int Wuerfel::getSeitenZahl()
{
    return seitenZahl;
}


int Wuerfel::wuerfeln(){
    return qrand() % ((seitenZahl + 1) - 1) + 1;
}

void Wuerfel::setSeitenZahl(int newSeitenZahl){
    if(seitenZahl != newSeitenZahl) {
        seitenZahl = newSeitenZahl;
        farbeChanged(); // trigger signal of property change
    }
}

void Wuerfel::setFarbe(QString newFarbe){
    if(farbe != newFarbe) {
        farbe = newFarbe;
        farbeChanged(); // trigger signal of property change
    }
}
