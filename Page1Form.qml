import QtQuick 2.13
import QtQuick.Controls 2.13

Page {
    id: mainWindow
    width: 220
    height: 240
    contentHeight: -6
    contentWidth: 0
    title: "Temperature Converter"

    Button {
        id: btnConvert
        x: 5
        y: 141
        width: 211
        height: 40
        text: qsTr("Convert")
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
        y: 93
        width: 211
        height: 40
        focusPolicy: Qt.StrongFocus
        currentIndex: 0
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
        x: 6
        y: 5
        text: qsTr("Please enter a value for conversion")
    }

    TextField {
        id: txtInput
        x: 6
        y: 27
        width: 210
        height: 40
        inputMethodHints: Qt.ImhDigitsOnly
        property var validKelvin: DoubleValidator {decimals:2; bottom: 0 }
        property var validCelcius: DoubleValidator {decimals:2; bottom: -273.15 }
        property var validFahrenheit: DoubleValidator {decimals:2; bottom: -459.67 }
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

    TextField {
        id: txtResult
        x: 6
        y: 190
        width: 211
        height: 40
        readOnly: true
        selectByMouse: true
    }

    Label {
        id: label1
        x: 6
        y: 71
        text: qsTr("Please select a conversion")
    }
}
