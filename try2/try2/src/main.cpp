#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "refereebox.h"


namespace ZSS{
}
void qmlRegister(){
    qmlRegisterType<RefBoxCommand>("ZSS", 1, 0, "RefBoxCommand");
    qmlRegisterType<GameState>("ZSS", 1, 0, "GameState");
    qmlRegisterType<RefereeBox>("ZSS", 1, 0, "RefereeBox");
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegister();
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
