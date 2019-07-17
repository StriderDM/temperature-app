import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    id: mainWindow
    width: parent.width
    height: parent.height
    padding: 5
    leftPadding: 5
    rightPadding: 5
    bottomPadding: 5
    topPadding: 5
    wheelEnabled: false
    spacing: 2
    contentHeight: -6
    contentWidth: 0
    title: "Temperature Converter"

    Button {
        id: btnConvert
        x: 5
        width: parent.width
        height: 40
        text: qsTr("Convert")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: cbChoice.bottom
        anchors.topMargin: 5
        focusPolicy: Qt.NoFocus
        enabled: txtInput.acceptableInput && (txtInput.text.length > 0)
        onClicked: {
            txtResult.text =
                    converter.convert(txtInput.text,
                                      cbChoice.model.get(cbChoice.currentIndex).value);
        }
    }

    ComboBox {
        id: cbChoice
        x: 5
        width: parent.width
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: label1.bottom
        anchors.topMargin: 5
        focusPolicy: Qt.StrongFocus
        currentIndex: 0
        onCurrentIndexChanged: txtResult.clear()
        textRole: "key"
              model: ListModel {
                  id: cbItems
                  ListElement { key: "°C -> °F"; value: 1 }
                  ListElement { key: "°F -> °C"; value: 2 }
                  ListElement { key: " K -> °C"; value: 3 }
                  ListElement { key: "°C ->  K"; value: 4 }
                  ListElement { key: " K -> °F"; value: 5 }
                  ListElement { key: "°F ->  K"; value: 6 }
              }
    }

    Label {
        id: label
        text: qsTr("Enter a value for conversion")
        opacity: 0.5
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        clip: false
    }

    TextField {
        id: txtInput
        width: parent.width
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: label.bottom
        anchors.topMargin: 5
        renderType: Text.QtRendering
        onTextEdited: txtResult.clear();
        inputMethodHints: Qt.ImhDigitsOnly
        property var validKelvin: DoubleValidator {decimals:2; bottom: 0 }
        property var validCelcius: DoubleValidator {decimals:2; bottom: -273.15 }
        property var validFahrenheit: DoubleValidator {decimals:2; bottom: -459.67 }
        x: 6
        validator:
            switch(cbChoice.model.get(cbChoice.currentIndex).value)
            {
                case 1:
                case 4: validCelcius; break;
                case 2:
                case 6: validFahrenheit; break;
                default: validKelvin;
            }
    }

    Label {
        id: label1
        x: 6
        text: qsTr("Select a conversion")
        fontSizeMode: Text.FixedSize
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: txtInput.bottom
        anchors.topMargin: 5
    }

    TextField {
        id: txtResult
        x: 6
        width: parent.width
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: btnConvert.bottom
        anchors.topMargin: 5
        readOnly: true
        selectByMouse: true
    }

}













/*##^## Designer {
    D{i:1;anchors_y:141}D{i:2;anchors_x:5;anchors_y:93}D{i:10;anchors_x:6;anchors_y:5}
D{i:11;anchors_height:40;anchors_x:6;anchors_y:27}D{i:15;anchors_x:6;anchors_y:71}
D{i:16;anchors_y:190}
}
 ##^##*/
