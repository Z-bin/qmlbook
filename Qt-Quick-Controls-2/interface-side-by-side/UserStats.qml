import QtQuick 2.0
import QtQuick.Controls 2.12

Page {
    header: Label {
        text: qsTr("Your stats")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        text: qsTr("User statistics")
        anchors.centerIn: parent
    }
}
