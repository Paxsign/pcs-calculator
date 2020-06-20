#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQuickControls2>
#include "first_stage.h"
#include "second_stage_activity_model.h"
#include "second_stage.h"
#include "third_stage.h"
#include "third_stage_product_model.h"
#include "summary.h"


int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);



    qmlRegisterType<Second_stage_activity_model>("Act_model",1,0,"Second_stage_activity_model");
    qmlRegisterType<third_stage_product_model>("Product_model",1,0,"Third_stage_product_model");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
     engine.load(url);

    QObject* root = engine.rootObjects()[0];
    first_stage First_stage(root);
    engine.rootContext()->setContextProperty("_First_stage",&First_stage);
    second_stage Second_stage(root);
    engine.rootContext()->setContextProperty("_Second_stage",&Second_stage);
    third_stage Third_stage(root);
    engine.rootContext()->setContextProperty("_Third_stage",&Third_stage);
    summary Ssummary(root);
    engine.rootContext()->setContextProperty("_Ssummary",&Ssummary);

    return app.exec();
}
