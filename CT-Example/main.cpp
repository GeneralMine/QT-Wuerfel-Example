#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "wuerfel.h"
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<Wuerfel>("de.wuerfelbude.wuerfel", 1, 0, "WuerfelRaw"); // MyQMLType will be usable with: import com.yourcompany.xyz 1.0

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
