import QtQuick 2.0
import "../common"

Background {
    width: 80
    height: 300

    ListView {
        anchors.fill: parent
        anchors.margins: 20

        // 是否裁剪
        clip: true

        model: 100
//        boundsBehavior: Flickable.DragOverBounds

        delegate: numberDelegate
        spacing: 5
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
