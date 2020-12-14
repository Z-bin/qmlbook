import QtQuick 2.12
import QtQuick.Controls 2.5

import QtQuick.Window 2.0

import "common"

Window {
    width: 320
    height: 320

    visible: true

    Background {
        anchors.fill: parent

        TableView {
            id: view
            anchors.fill: parent
            anchors.margins: 20

            rowSpacing: 5
            columnSpacing: 5

            clip: true

            model: tableModel
            delegate: cellDelegate
        }
    }

    Component {
        id: cellDelegate

        GreenBox {
            implicitHeight: 40
            implicitWidth: 40

            Text {
                anchors.centerIn: parent
                // 从DisplayRole获得数据
                text: display
            }
        }
    }
}
