
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "dirmp3.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<DirMp3>("AddMp3File",1,0, "DirMp3");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/Version1/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
