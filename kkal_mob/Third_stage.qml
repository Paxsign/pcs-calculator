import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

import Product_model 1.0


Item {
    id:third_stage_item

        Column{
            id:prod_rec
            ComboBox{
            width:third_stage_item.width
            id:eat_combobox
            height: (25*window.height)/100
            model: ["Завтрак","Обед","Ужин"]
            onActivated:{ prod_stackview.currentIndex=eat_combobox.currentIndex}
            }
            Rectangle{
                width:third_stage_item.width
                height: (25*window.height)/100
                Row{
                    anchors.fill: parent
                    ComboBox{
                        id:product_combobox
                        width: parent.width/3
                        height: parent.height
                        textRole: "name"
                        model: Third_stage_product_model{
                            id:product_model
                            objectName: product_model
                            property real kcal: product_model.data(product_model.index(product_combobox.currentIndex,0),8)
                        }

                    }
                    TextEdit{
                        id: text_weight
                        width: parent.width/3
                        height: parent.height


                    }
                    Rectangle{
                        width: parent.width/3
                        height: parent.height

                        Button{
                            id:but
                            anchors.fill:parent
                            text: ""
                            onClicked:{ _Third_stage.get_product(text_weight.text.toString(),product_combobox.currentIndex,prod_stackview.currentIndex)
                                switch (prod_stackview.currentIndex){

                                case (0) :
                                    listmodel_prod.append({prod_name_kcal:product_combobox.currentText + " " +product_model.kcal})
                                    break
                                case (1) :
                                    listmodel_prod_2.append({prod_name_kcal:product_combobox.currentText + " " +product_model.kcal})
                                    break
                                case (2) :
                                    listmodel_prod_3.append({prod_name_kcal:product_combobox.currentText + " " +product_model.kcal})
                                    break
                                }
                                }
                        }
                    }


                }
            }
        }
  //  }
    StackLayout{
        id:prod_stackview
        currentIndex: 0

        anchors.bottom:total_kcal_rect.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: prod_rec.bottom
    ListView{
        //anchors.top: prod_rec.bottom
        //height: 300
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        //anchors.top: prod_rec.bottom

        delegate: Item {
            anchors.left: parent.left
            anchors.right: parent.right
            height: (15*window.height)/100
            width: parent.width

            Rectangle{
                width: parent.width/2
                height: parent.height
                color: "#a6f5ff"


                Text {

                    text:  prod_name_kcal

                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height
                color: "#b7a6ff"
                anchors.right: parent.right
                Text{
                    text:"delete"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                    _Third_stage.get_product (index,0)
                    listmodel_prod.remove(index)
                    }
                }
            }

        }
        model: ListModel{
            id:listmodel_prod
        }
    }
    ListView{
        //anchors.top: prod_rec.bottom
        //height: 300
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        //anchors.top: prod_rec.bottom

        delegate: Item {
            anchors.left: parent.left
            anchors.right: parent.right
            height: (15*window.height)/100
            width: parent.width


            Rectangle{
                width: parent.width/2
                height: parent.height
                color: "#a6f5ff"


                Text {

                    text:  prod_name_kcal

                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height
                color: "#b7a6ff"
                anchors.right: parent.right
                Text{
                    text:"delete"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                    _Third_stage.get_product (index,1)
                    listmodel_prod_2.remove(index)
                    }

                }
            }

        }
        model: ListModel{
            id:listmodel_prod_2
        }
    }
    ListView{
        //anchors.top: prod_rec.bottom
        //height: 300
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        //anchors.top: prod_rec.bottom

        delegate: Item {
            anchors.left: parent.left
            anchors.right: parent.right
            height: (15*window.height)/100
            width: parent.width
            id: name

            Rectangle{
                width: parent.width/2
                height: parent.height
                color: "#a6f5ff"


                Text {

                    text:  prod_name_kcal

                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height
                color: "#b7a6ff"
                anchors.right: parent.right
                Text{
                    text:"delete"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                    _Third_stage.get_product (index,2)
                    listmodel_prod_3.remove(index)
                    }

                }
            }

        }
        model: ListModel{
            id:listmodel_prod_3
        }
    }
    }

    Rectangle{
        id:total_kcal_rect
        anchors.bottom: nav_row_ths.top
        width: parent.width
        height: (15*window.height)/100
        Connections{
            target: _Third_stage
            onSend_product: text_total_kcal.text=kcal;
        }

        Text {
            width: parent.width
            height: 100
            id: text_total_kcal

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



        Rectangle{
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
                acceptedDevices: PointerDevice.TouchScreen
                onTapped: stackview.push(hello_screen)
            }

            MouseArea{
                anchors.fill: parent
                onClicked: stackview.push(summary_screen)
            }

        }
    }


}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
