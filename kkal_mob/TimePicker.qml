import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Controls 2.12


    Frame {
        id: frame
        padding: 0
        anchors.centerIn: parent
        height: 50
        visible: true

        Row {
            id: row

            Tumbler {
                id: hoursTumbler
                model: 12
                delegate: delegateComponent
            }

            Tumbler {
                id: minutesTumbler
                height: 50
                model: 60
                delegate: delegateComponent
            }


        }
    }
