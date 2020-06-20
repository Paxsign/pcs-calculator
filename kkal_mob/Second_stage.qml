import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

import Act_model 1.0

Item {
    property int number: 0

    /* Строка с полем, где отображается индекс нажатой динамической кнопки,
     * кнопкой для создания динамических кнопок,
     * и кнопкой для удаления динамических кнопок по индексу
     * */
    Row
    {
        id: row
        // Задаём размеры строки и прибиваем к верхней части окна приложения
        height: (25*window.height)/100
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 5
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        // Задаём размещение поля с индексом кнопки
        Rectangle {


            width: parent.width
            height: parent.height
            ComboBox {
                id: actions_combobox
                width: parent.width
                height: parent.height
                textRole: "key"
                model: Second_stage_activity_model{
                    id:actions_listmodel
                    //objectName: actions_listmodel
                    property real rate: actions_listmodel.data(actions_listmodel.index(actions_combobox.currentIndex,0),1)
                }
            }
        }
    }
    Row{
        id:row_time
        anchors.top: row.bottom
        width: parent.width
        height: (25*window.height)/100

        Rectangle{
            id: rectangle
            height: parent.height
            width: parent.width/2
            color: "#94ffbf"
            Row {
                id: row_tumb_time
                x: 0
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                layoutDirection: Qt.LeftToRight

                spacing: 50
                Tumbler {
                    objectName: hoursTumbler
                    id: hoursTumbler
                    height: parent.height
                    width: 100
                    font.pointSize: 20
                    visibleItemCount: 2
                    model: 24
                }

                Tumbler {
                    objectName: minutesTumbler
                    id: minutesTumbler
                    height: parent.height
                    width: 100
                    font.pointSize: 20
                    visibleItemCount: 2

                    model: 60

                }
            }

        }
        // Кнопка для создания динамических кнопок
        Rectangle {
            id: button1
            width: parent.width/2
            anchors.right: parent.right
            height: parent.height
            color: 'green'

            /* По клику по кнопке добавляем в model ListView
             * объект, с заданными параметрами
             * */

            TapHandler{
                acceptedDevices: PointerDevice.TouchScreen
                onTapped:{
                    _Second_stage.get_rate_time_activ(actions_listmodel.rate,hoursTumbler.currentIndex, minutesTumbler.currentIndex)
                    listModel.append({activity_name: actions_combobox.currentText +"  "+ actions_listmodel.rate})

                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    _Second_stage.get_rate_time_activ(actions_listmodel.rate,hoursTumbler.currentIndex, minutesTumbler.currentIndex)
                    listModel.append({"activity_name": actions_combobox.currentText, "activity_rate": actions_listmodel.rate})


                }
            }
    }
    }

    // ListView для представления данных в виде списка
    ListView {
        id: listView1
        keyNavigationWraps: true
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        // Размещаем его в оставшейся части окна приложения
        anchors.top: row_time.bottom
        anchors.bottom: inform.top
        anchors.left: parent.left
        anchors.right: parent.right



        /* в данном свойстве задаём вёрстку одного объекта
         * который будем отображать в списке в качестве одного элемента списка
         * */
        delegate: Item {
            id: active_item
            anchors.left: parent.left
            anchors.right: parent.right
            height: (15*window.height)/100


            // В данном элементе будет находиться одна кнопка
            Rectangle{
                //anchors.fill: parent
                color: "#a6f5ff"
                width: (parent.width/100)*70
                height: parent.height
                anchors.left: parent.left


            Text{
                anchors.left: parent.left
                width: parent.width
                //anchors.margins: 5
                text: activity_name + " " + activity_rate
                elide: Text.ElideRight
            }
            }

            Rectangle {
                anchors.right: parent.right
               width:(parent.width/100)*30
               height: parent.height
                color: "#b8ffa6"
                /* самое интересное в данном объекте
                 * задаём свойству text переменную, по имени которой будем задавать
                 * свойства элемента
                 * */
                Text{
                    anchors.fill: parent
                    text: 'delete'
                }
                TapHandler{
                    acceptedDevices: PointerDevice.TouchScreen
                    onTapped:{
                        _Second_stage.get_rate_time_activ(index)
                           listModel.remove(index)
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                     _Second_stage.get_rate_time_activ(index)
                        listModel.remove(index)
                    }
                }

            }
        }

        // Сама модель, в которой будут содержаться все элементы
        model: ListModel {
            id: listModel // задаём ей id для обращения
        }
    }
    Rectangle{
        id:inform
        anchors.bottom: nav_row_ss.top
        width: parent.width
        height: (15*window.height)/100
        Connections{
            target: _Second_stage
            onSend_kcal_burn_full_time: time.text=kcal_burn+'  '+hours+':'+minute;
        }

        Text {
            width: parent.width
            height: 100
            id: time
            text: qsTr("")
        }
    }
    Row{
        id:nav_row_ss
        x: 0
        height: (20*window.height)/100
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.bottom: parent.bottom

        width: parent.width

        Rectangle{
            width: parent.width
            height: parent.height
            color: "#b8ffa6"
            Text {
                id: to_third_stage
                height: parent.height
                width: parent.width
                text: qsTr("Next")
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

        }
    }

   }



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
