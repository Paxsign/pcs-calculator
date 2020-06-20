import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Window 2.12


Window {
    id: window
    visible: true
    width: 800
    height: 600
    title: qsTr("Kkal")


    StackView{
        id:stackview
        anchors.fill: parent
        initialItem: hello_screen
    }
    Component{
        id:hello_screen
        Hello_screen{}
    }

    Component{
        id:first_stage
        First_stage{}
    }
    Component{
        id:second_stage
        Second_stage{}
    }
    Component{
        id:third_stage
        Third_stage{}
    }
    Component{
        id:summary_screen
        Summary_screen{}
    }

/*
    Loader{
        id:loader
        anchors.fill: parent
       sourceComponent: "main.qml"

    }*/
    }


