import QtQuick 2.0
import "../common"

Background {
    width: 480
    height: 80

    ListView {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 4
        clip: true
        model: 100
        orientation: ListView.Horizontal
        delegate: numberDelegate
    }

    Component {
        id: numberDelegate

        GreenBox {
            width: 40
            height: 40
            text: index
        }
    }
}
