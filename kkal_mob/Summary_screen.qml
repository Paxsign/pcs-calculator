
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick 2.12

Item {
    id:summary_sreen_item
    property var summary_var: []
    ScrollView {
        anchors.top:summary_eat_combobox.bottom
        width: window.width
        height: (80*window.height)/100
        id:summ_ScrollView
        Column{
        id: frame
            spacing: 10
         ComboBox{
                         width:window.width
                         id:summary_eat_combobox
                         height: (25*window.height)/100
                         model: ["Завтрак","Обед","Ужин","Всего"]
                         onActivated:{ _Ssummary.get_summary(summary_eat_combobox.currentIndex)}
         Connections{
             target: _Ssummary
             onSend_summary: {
                 kcal_loss_text.text=total_burn_kcal;
                 kcal_text.text=summary_list[7];
                 carb_text.text=summary_list[4];
                 animal_proteins_text.text=summary_list[0];
                 vegetable_proteins_text.text=summary_list[1];
                 animal_lipid_text.text=summary_list[2];
                 vegetable_lipid_text.text=summary_list[3];
                 ca_text.text=summary_list[5];
                 p_text.text=summary_list[6];
                 vit_C_text.text=summary_list[8];
                 unknown_1_text.text=summary_list[9];
                 unknown_2_text.text=summary_list[10];

         }
         }
         }
         Rectangle{
             width: window.width
             height: (15*window.height)/100
             Row{id:kcal_loss_row
                 width: parent.width
                 height: parent.height

                 Rectangle{

                 width: parent.width/2
                 height: parent.height
                 Text {
                     id: kcal_loss
                     text: qsTr("Ккал потрачено")
                     font.bold: true
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: Text.AlignHCenter
                     font.pointSize: 18
                 }
             }
             Rectangle{

                 width: parent.width/2
                 height: parent.height
                 border.color: "blue"
                 Text {
                     id: kcal_loss_text
                     objectName: "kcal_loss_text"
                     color: "black"
                     font.pointSize: 18
                     anchors.fill: parent
                     //text: summary_var[0]
                 }
             }
         }

     }
        Rectangle{
            width: window.width
            height: (15*window.height)/100
            Row{id:kcal_row
                width: parent.width
                height: parent.height

                Rectangle{

                width: parent.width/2
                height: parent.height
                Text {
                    id: kcal
                    text: qsTr("Ккал")
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 18
                }
            }
            Rectangle{

                width: parent.width/2
                height: parent.height
                border.color: "blue"
                Text {
                    id: kcal_text
                    objectName: "weight_input"
                    color: "black"
                    font.pointSize: 18
                    anchors.fill: parent
                    //text: summary_var[0]
                }
            }
        }

    }
        Rectangle{
            width: window.width
            height: (15*window.height)/100
            Row{id:carb_row
                width: parent.width
                height: parent.height
            Rectangle{

                width: parent.width/2
                height: parent.height
                Text {
                    id: carb
                    text: qsTr("Углеводы")
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 18
                }
            }
            Rectangle{

                width: parent.width/2
                height: parent.height
                border.color: "blue"
                Text {
                    id: carb_text
                    objectName: "weight_input"
                    color: "black"
                    font.pointSize: 18
                    anchors.fill: parent
                }
            }
        }

    }
        Rectangle{
            width: window.width
            height: (15*window.height)/100
            Row{id:animal_proteins_row
                width: parent.width
                height: parent.height
            Rectangle{

                width: parent.width/2
                height: parent.height
                Text {
                    id: animal_proteins
                    text: qsTr("Животные белки")
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 18
                }
            }
            Rectangle{

                width: parent.width/2
                height: parent.height
                border.color: "blue"
                Text {
                    id: animal_proteins_text
                    objectName: "weight_input"
                    color: "black"
                    font.pointSize: 18
                    anchors.fill: parent
                }
            }
        }

    }
        Rectangle{
            width: window.width
            height: (15*window.height)/100
            Row{id:vegetable_proteins_row
                width: parent.width
                height: parent.height
            Rectangle{

                width: parent.width/2
                height: parent.height
                Text {
                    id: vegetable_proteins
                    text: qsTr("Растительные белки")
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 18
                }
            }
            Rectangle{

                width: parent.width/2
                height: parent.height
                border.color: "blue"
                Text {
                    id: vegetable_proteins_text
                    objectName: "weight_input"
                    color: "black"
                    font.pointSize: 18
                    anchors.fill: parent
                }
            }
        }

    }
        Rectangle{
            width: window.width
            height: (15*window.height)/100
            Row{id:animal_lipid_row
                width: parent.width
                height: parent.height
            Rectangle{

                width: parent.width/2
                height: parent.height
                Text {
                    id: animal_lipid
                    text: qsTr("Животные жиры")
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 18
                }
            }
            Rectangle{

                width: parent.width/2
                height: parent.height
                border.color: "blue"
                Text {
                    id: animal_lipid_text
                    objectName: "weight_input"
                    color: "black"
                    font.pointSize: 18
                    anchors.fill: parent
                }
            }
        }

    }
        Rectangle{
            width: window.width
            height: (15*window.height)/100
            Row{id:vegetable_lipid_row
                width: parent.width
                height: parent.height
            Rectangle{

                width: parent.width/2
                height: parent.height
                Text {
                    id: vegetable_lipid
                    text: qsTr("Растительные жиры")
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 18
                }
            }
            Rectangle{

                width: parent.width/2
                height: parent.height
                border.color: "blue"
                Text {
                    id: vegetable_lipid_text
                    objectName: "weight_input"
                    color: "black"
                    font.pointSize: 18
                    anchors.fill: parent
                }
            }
        }

    }
        Rectangle{
            width: window.width
            height: (15*window.height)/100
            Row{id: ca_row
                width: parent.width
                height: parent.height
            Rectangle{

                width: parent.width/2
                height: parent.height
                Text {
                    id: ca
                    text: qsTr("Ca")
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 18
                }
            }
            Rectangle{

                width: parent.width/2
                height: parent.height
                border.color: "blue"
                Text {
                    id: ca_text
                    objectName: "weight_input"
                    color: "black"
                    font.pointSize: 18
                    anchors.fill: parent
                }
            }
        }

    }
        Rectangle{
            width: window.width
            height: (15*window.height)/100
            Row{id:p_row
                width: parent.width
                height: parent.height
            Rectangle{

                width: parent.width/2
                height: parent.height
                Text {
                    id: p
                    text: qsTr("P")
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 18
                }
            }
            Rectangle{

                width: parent.width/2
                height: parent.height
                border.color: "blue"
                Text {
                    id: p_text
                    objectName: "weight_input"
                    color: "black"
                    font.pointSize: 18
                    anchors.fill: parent
                }
            }
        }

    }
        Rectangle{
            width: window.width
            height: (15*window.height)/100
            Row{id:vit_C_row
                width: parent.width
                height: parent.height
            Rectangle{

                width: parent.width/2
                height: parent.height
                Text {
                    id: vit_C
                    text: qsTr("Витамин C")
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 18
                }
            }
            Rectangle{

                width: parent.width/2
                height: parent.height
                border.color: "blue"
                Text {
                    id: vit_C_text
                    objectName: "weight_input"
                    color: "black"
                    font.pointSize: 18
                    anchors.fill: parent
                }
            }
        }

    }
        Rectangle{
            width: window.width
            height: (15*window.height)/100
            Row{id:unknown_1_row
                width: parent.width
                height: parent.height
            Rectangle{

                width: parent.width/2
                height: parent.height
                Text {
                    id: unknown_1
                    text: qsTr("unknown_1")
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 18
                }
            }
            Rectangle{

                width: parent.width/2
                height: parent.height
                border.color: "blue"
                Text {
                    id: unknown_1_text
                    objectName: "weight_input"
                    color: "black"
                    font.pointSize: 18
                    anchors.fill: parent
                }
            }
        }

    }
        Rectangle{
            width: window.width
            height: (15*window.height)/100
            Row{id:unknown_2_row
                width: parent.width
                height: parent.height
            Rectangle{

                width: parent.width/2
                height: parent.height
                Text {
                    id: unknown_2
                    text: qsTr("unknown_2")
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 18
                }
            }
            Rectangle{

                width: parent.width/2
                height: parent.height
                border.color: "blue"
                Text {
                    id: unknown_2_text
                    objectName: "weight_input"
                    color: "black"
                    font.pointSize: 18
                    anchors.fill: parent
                }
            }
        }

    }

}
    }


        Row{
            id:nav_row_ths
            x: 0
            height: (20*window.height)/100
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.bottom: parent.bottom

            width: parent.width
            /*Rectangle{
                width: parent.width/2
                height: parent.height
                color: '#88FEF8'
                Text {
                    id: to_second_stage
                    height: parent.height
                    width: parent.width
                    text: qsTr("Back")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                TapHandler{
                    acceptedDevices: PointerDevice.TouchScreen
                    onTapped: stackview.push(third_stage)
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: stackview.push(third_stage)
                }
            }*/



            Rectangle{
                height: parent.height
                width: parent.width
                color: "#b8ffa6"
                Text {

                    text: "Start again"
                    font.bold: true
                    font.pointSize: 12
                    font.family: "Verdana"
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                TapHandler{
                    acceptedDevices: PointerDevice.TouchScreen
                    onTapped: stackview.push(hello_screen)
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {stackview.push(hello_screen);
                                _Ssummary.clear_var();
                    }
                }

            }
}
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
