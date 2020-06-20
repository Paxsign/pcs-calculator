import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Window 2.12

Item {
    id: element
    Rectangle{
        id: rectangle
        anchors.fill: parent

        Text {
            id: hello_text
            text: qsTr("HELLO")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
        }
        Rectangle{
            id: rectangle1
            y: 196
            width: 300
            height: 150
            color: "#9bc5f9"
            anchors.verticalCenterOffset: 95
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Text {

                text: qsTr("Начать")
                font.pointSize: 20
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            TapHandler{
                onTapped: stackview.push(first_stage)
            }
        }

    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
