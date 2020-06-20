import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4 as Oldcntl
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12 as Newcntrl


Item {
    id: element



    Newcntrl.ScrollView {

        width: window.width
        height: (80*window.height)/100

    Column{
    id: frame
        spacing: 15
            Rectangle{
                width: element.width
                height: (15*window.height)/100
                Row{id:weight_row
                    width: parent.width
                    height: parent.height
                Rectangle{

                    width: parent.width/2
                    height: parent.height
                    Text {
                        id: weight
                        text: qsTr("Вес")
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 18
                    }
                }
                Rectangle{
                    id:weight_
                    width: parent.width/2
                    height: parent.height
                    border.color: "blue"
                    TextInput {
                        id: weight_input
                        objectName: "weight_input"
                        color: "black"
                        font.pointSize: 18
                        anchors.fill: parent
                    }
                }
            }
            }
            Rectangle{

                //anchors.top: weight_row.bottom
                width: element.width
                height: (15*window.height)/100
                Row{id:height_row
                    width: parent.width
                    height: parent.height
                Rectangle{
                    width: parent.width/2
                    height: parent.height
                    Text {
                        id: height1
                        text: qsTr("Рост")
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 18

                    }
                }

                Rectangle{
                    id:height_
                    width: parent.width/2
                    height: parent.height
                    border.color: "blue"
                    TextInput {
                        id: height_input
                        objectName: "height_input"
                        color: "black"
                        font.pointSize: 18
                        anchors.fill: parent
                    }
                }
            }
            }
            Rectangle{
                width: element.width
                height: (15*window.height)/100
            Row{
                id:age_row
                width: parent.width
                height:parent.height
                Rectangle{
                    width: parent.width/2
                    height: parent.height
                   Text {
                        id: age
                        text: qsTr("Возраст")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.bold: true
                        font.family: "MS Shell Dlg 2"
                        font.pointSize: 18

                        }
                }
                Rectangle{
                    id:age_
                    width: parent.width/2
                    height: parent.height
                    border.color: "blue"
                    TextInput {
                        id: age_input
                        objectName: "age_input"
                        color: "black"
                        font.pointSize: 18
                        anchors.fill: parent
                    }
                }
            }
            }
            Rectangle{
                width: element.width
                height: (15*window.height)/100
            Row{
                id:sex_row
                //anchors.top: age_row.bottom
                width: parent.width
                height: parent.height

                Rectangle{
                    width: parent.width/2
                    height: parent.height
                    Text {
                        id: sex
                        text: qsTr("Пол")
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 18

                        }
                    }

                    Oldcntl.ExclusiveGroup {
                        id: tabSexGroup
                    }
                    Oldcntl.RadioButton {
                        id:male
                        objectName: "male"
                        text: "Муж"
                        anchors.top: parent.top
                        anchors.topMargin: 0
                        checked: true
                        exclusiveGroup: tabSexGroup
                    }
                    Oldcntl.RadioButton {
                        id:female
                        objectName: "female"
                        text: "Жен"
                        exclusiveGroup: tabSexGroup

                }

            }
            }


            Rectangle{
                width: element.width
                height: (15*window.height)/100
                id:plus
                color: "#b8fef3"
                Text {
                    text: qsTr("Вычислить основной обмен")
                    font.pointSize: 19
                    font.bold: true
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                TapHandler{
                onTapped: _First_stage.buttonClicked(age_input.text,height_input.text,weight_input.text,male.checked,female.checked);

                }
                MouseArea{
                    anchors.fill:parent
                onClicked: _First_stage.buttonClicked(age_input.text,height_input.text,weight_input.text,male.checked,female.checked);
                }
                Connections{
                    target: _First_stage
                    onSend_voo:{voo_input.text = s_voo}
                }
            }
            Rectangle{
                width: element.width
                height: (15*window.height)/100
            Row{
                id:voo_row
               // anchors.top: plus.bottom
                width: parent.width
                height: parent.height
                Rectangle{
                    width: parent.width/2
                    height: parent.height
                    Text {
                        id: voo
                        text: qsTr("ВОО")
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 18

                }
                }

                Rectangle{
                    id:voo_
                    width: parent.width/2
                    height: parent.height
                    border.color: "blue"
                    TextInput {
                        id: voo_input
                        objectName: "voo_input"
                        color: "black"
                        font.pointSize: 18
                        anchors.fill: parent
                    }
                }
            }
            }
           }


//}
}
            Row{
                id:nav_row_fs
                width: parent.width
                height: (20*window.height)/100
                anchors.bottom: parent.bottom

                Rectangle{
                id:to_second_stage
                height: parent.height
                width: parent.width
                color: "#b8ffa6"
                Text {

                    text: "Next"
                    font.bold: true
                    font.pointSize: 12
                    font.family: "Verdana"
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                TapHandler{
                    onTapped: stackview.push(second_stage)
                }
                MouseArea{
                    anchors.fill:parent
                    onClicked: stackview.push(second_stage)
                }
            }


    }
}






/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
