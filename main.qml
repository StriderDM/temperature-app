import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: if (parent.width < 400)
           {
            400
           }
           else parent.width
    height: parent.height
    title: qsTr("Temperature Converter")
    Page1Form {
        width: parent.width
        height: parent.height

    }
}
